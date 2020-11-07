@days = %w[monday tuesday wednesday thursday friday saturday sunday]
@colors = {
  "default" => :black,
  "title_day" => :yellow,
  "no_events" => :light_black,
  "tech" => :red,
  "soft skills" => :green
}

@colors_avalible = %i[magenta light_red light_green light_yellow blue light_blue light_magenta cyan light_cyan]

# :black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue,
# :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]

def list(year, week_munber)
  # get all events for week
  data_week = @events[year][week_munber]

  # sort elements by day and end_date
  data_week = get_events_by_day(data_week, year, week_munber)

  # Print calenCLI
  just_space = 15
  line_break = "\n"
  puts "#{'-' * 35}CalenCLI#{'-' * 35}#{line_break * 2}"
  print_days(data_week, just_space, line_break)
end

def get_events_by_day(data_week, year, week_number)
  @days.each_with_object({}) do |day, accumulator|
    day_title = get_title_day(year, week_number, day)
    accumulator[day_title] = []

    if data_week.is_a?(Array)
      accumulator[day_title] = data_week.select { |event| event[:start_date].strftime("%A").downcase.eql?(day) }
      sort_events_by_day(accumulator[day_title])
    end
    accumulator
  end
end

def get_title_day(year, week_number, day)
  date_value = "#{year}-W#{week_number}-#{@days.index(day) + 1}"
  date_format = "%G-W%V-%u"
  new_date = DateTime.strptime(date_value, date_format)
  new_date.strftime("%a %b %d")
end

def sort_events_by_day(events)
  events.sort! { |event, next_event| event[:end_date].to_s <=> next_event[:end_date].to_s }
end

def print_days(week_by_day, just_space = 15, line_break = "\n")
  week_by_day.each do |day, events|
    print_day_date(day, just_space)

    if events.empty?
      puts colorize_string("no_events", "#{' ' * just_space}No events")
    else
      print_day_events(events, just_space)
    end
    puts line_break
  end
end

def print_day_date(day_not_formatted, just_space)
  day_formatted = day_not_formatted.ljust(just_space, " ")
  print colorize_string("title_day", day_formatted)
end

def print_day_events(day_events, just_space)
  details = ""

  day_events.map do |event|
    details = details.empty? ? "" : " " * just_space
    details << get_hour_to_print(event, just_space) << event[:title]

    puts "#{colorize_string(event[:calendar], details)} #{colorize_string('default', '(' << event[:id].to_s << ')')}"
  end
end

def get_hour_to_print(event, just_space)
  hour = ""
  if event[:end_date].is_a?(Date)
    hour << event[:start_date].strftime("%H:%M") << " - " << event[:end_date].strftime("%H:%M")
  end
  hour.ljust(just_space, " ")
end

def colorize_string(color, description)
  update_color(color) unless @colors.key?(color)
  description.colorize(@colors[color])
end

def update_color(calendar)
  color = @colors_avalible.shift
  color = :default if color.nil?
  @colors[calendar] = color
end
