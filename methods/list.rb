# For set if monday or sunday is first
@days = %w[monday tuesday wednesday thursday friday saturday sunday]

# For save the colors while the program is running
@colors = {
  "default" => :black,
  "title_day" => :yellow,
  "no_events" => :light_black,
  "tech" => :red,
  "soft skills" => :green
}

# For assign colors automatically to new calendar styles
@colors_avalible = %i[magenta light_blue cyan light_magenta light_cyan light_red light_green light_yellow blue]

# :black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue,
# :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]

# By spacing
@just_space = 15
@line_break = "\n"

# method to list a week using as parameter year and week
def list(year, week_munber)
  # get all events for week
  data_week = @events[year][week_munber]

  # sort elements by day and end_date
  data_week = get_events_by_day(data_week, year, week_munber)

  # Print calenCLI
  @just_space = 15
  print_days(data_week)

  @just_space = 10
  print_days_vertical(data_week)
end

# Get all events of the week in given year
def get_events_by_day(data_week, year, week_number)
  @days.each_with_object({}) do |day, accumulator|
    day_title = get_title_day(year, week_number, day)
    # for default the day has an empty array
    accumulator[day_title] = []

    # If there are events in data, so and sort them by day
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
  new_date.strftime("%A %b %d")
end

def sort_events_by_day(events)
  events.sort! { |event, next_event| event[:end_date].to_s <=> next_event[:end_date].to_s }
end

# Print week
def print_days(week_by_day)
  week_by_day.each do |day, events|
    print_day_date(day)

    if events.empty?
      puts colorize_string("no_events", "#{' ' * @just_space}No events")
    else
      print_day_events(events)
    end
    puts @line_break
  end
end

# To print day header, example:  Fri Nov 06
def print_day_date(day_not_formatted)
  day_not_formatted = day_not_formatted.split
  day_not_formatted[0] = day_not_formatted[0][0, 3]
  day_not_formatted = day_not_formatted.join(" ")
  day_formatted = day_not_formatted.ljust(@just_space, " ")
  print colorize_string("title_day", day_formatted)
end

# Print events of a day
def print_day_events(day_events)
  details = ""

  day_events.map do |event|
    details = details.empty? ? "" : " " * @just_space
    details << get_hour_to_print(event) << event[:title]

    puts "#{colorize_string(event[:calendar], details)} #{colorize_string('default', '(' << event[:id].to_s << ')')}"
  end
end

# To format the time event
def get_hour_to_print(event)
  hour = ""
  if event[:end_date].is_a?(Date)
    hour << event[:start_date].strftime("%H:%M") << " - " << event[:end_date].strftime("%H:%M")
  end
  hour.ljust(@just_space, " ")
end

# color to string, using a calendar or default values
def colorize_string(color, description)
  update_color(color) unless @colors.key?(color)
  description.colorize(@colors[color])
end

# For update @color automatically when there are new calendar types
def update_color(calendar)
  color = @colors_avalible.shift
  color = :default if color.nil?
  @colors[calendar] = color
end

# Print days vertical
def print_days_vertical(data_week)
  print_days_vertical_header_footer

  print_days_vertical_header(data_week)
  print_days_vertical_body(data_week)
  print_days_vertical_header_footer
end

def print_days_vertical_header(data_week, divider = "|")
  week_day = ""
  day_date = ""
  data_week.each_key do |title|
    title = title.split
    print_days_vertical_header_save(title, week_day, day_date, divider)
  end
  print_days_vertical_header_show(week_day, day_date, divider)
end

def print_days_vertical_header_save(title, week_day, day_date, divider)
  week_day << colorize_string("title_day", title[0].ljust(@just_space, " ")).prepend(divider)
  day_date << colorize_string("title_day", (title[2] << " " << title[1]).ljust(@just_space, " ")).prepend(divider)
end

def print_days_vertical_header_show(week_day, day_date, divider)
  puts week_day << divider
  print_days_vertical_header_footer
  puts day_date << divider
end

def print_days_vertical_body(data_week)
  debugged_week = []

  data_week.each_value do |day_events|
    temp_day = []
    day_events.each_with_object(temp_day) do |event, hash|
      hash << { calendar: event[:calendar], title: debug_title(event), new: true }
    end
    debugged_week << temp_day
  end
  print_days_vertical_body_show(debugged_week)
end

def print_days_vertical_body_show(debugged_week)
  continue = true
  while continue

    continue = false
    debugged_week.each do |day_events|
      event = day_events.shift

      continue = cell_content_eval(day_events, event, continue)
    end
    puts "|"
  end
end

def debug_title(event)
  return event[:title] unless event[:end_date].is_a?(Date)

  event[:start_date].strftime("%H:%M") << " " << event[:title]
end

def print_cell(color = :default, string = " ", initial_char = "|")
  print initial_char << colorize_string(color, string.ljust(@just_space, " "))
end

def cell_content_eval(day_events, event, continue)
  if event.nil? || event[:title].empty?
    print_cell
    continue

  elsif event[:new]
    cell_content_eval_event_new(day_events, event)

  else
    title = event[:title]
    cell_content_eval_event_size(day_events, event, title, continue)
  end
end

def cell_content_eval_event_new(day_events, event)
  event[:new] = false
  print_cell
  day_events.unshift(event)
  true # For continue switch
end

def cell_content_eval_event_size(day_events, event, title, continue)
  if title.size <= 10
    print_cell(event[:calendar], title)
    continue

  else
    space_index = title[0..10].rindex(" ")
    cell_content_eval_event_size_long(event, title, space_index)
    day_events.unshift(event)
    true
  end
end

def cell_content_eval_event_size_long(event, title, space_index)
  if space_index.nil?
    print_cell(event[:calendar], title[0..9])
    event[:title] = title[10..]
  else
    cell_content_eval_event_with_hour(event, title, space_index)
  end
end

def cell_content_eval_event_with_hour(event, title, space_index)
  if /^\d\d:\d\d/.match?(title)
    print_cell(event[:calendar], title[0..4])
    event[:title] = title[6..]
  else
    print_cell(event[:calendar], title[0...space_index])
    event[:title] = title[(space_index + 1)..]
  end
end

def print_days_vertical_header_footer(character = "-", length = 10, times = 7, divider = "+")
  content = character * length
  content.prepend(divider)
  content *= times
  content << divider
  puts content
end
