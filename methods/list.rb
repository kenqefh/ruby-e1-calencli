@days = %w[sunday monday tuesday wednesday thursday friday saturday]

def list(year, week_munber)
  # get all events for week
  data_week = @events[year][week_munber]

  # sort elements by day and end_date
  data_week = get_events_by_day(data_week)

  # Print calenCLI
  just_space = 15
  line_break = "\n"
  puts "#{'-' * 35}CalenCLI#{'-' * 35}#{line_break * 2}"
  print_days(data_week, just_space, line_break)
end

def get_events_by_day(data_week)
  @days.each_with_object({}) do |day, accumulator|
    accumulator[day] = []

    if data_week.is_a?(Array)
      accumulator[day] = data_week.select { |event| event[:start_date].strftime("%A").downcase.eql?(day) }
      sort_events_by_day(accumulator[day])
    end
    accumulator
  end
end

def sort_events_by_day(events)
  events.sort! { |event, next_event| event[:end_date].to_s <=> next_event[:end_date].to_s }
end

def print_days(week_by_day, just_space = 15, line_break = "\n")
  week_by_day.each do |day, events|
    print_day_date(day, just_space)

    if events.empty?
      puts "#{' ' * just_space}No events#{line_break * 2}"
    else
      print_day_events(events, just_space, line_break)
    end
  end
end

def print_day_date(day_not_formatted, just_space)
  day_formatted = day_not_formatted.ljust(just_space, " ")
  print day_formatted.colorize(:blue)
end

def print_day_events(day_events, just_space, line_break)
  day_events.map do |event|
    hour = ""
    if event[:end_date].is_a?(Date)
      hour << event[:start_date].strftime("%H:%M") << " - " << event[:end_date].strftime("%H:%M")
    end
    hour = hour.ljust(just_space, " ")

    print "#{hour}#{event[:title]} (#{event[:id]})#{line_break}#{' ' * just_space}"
  end
  print line_break
end
