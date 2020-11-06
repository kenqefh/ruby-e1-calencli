@days = %w[sunday monday tuesday wednesday thursday friday saturday]

def list(year, week_munber)
  data_week = @events[year][week_munber]

  date_sort(data_week)
end

def date_sort(data_week)
  week_by_day = {}
  @days.each do |day|
    week_by_day[day] = data_week.select { |event| event[:start_date].strftime("%A").downcase.eql?(day) }
  end
  print_list(week_by_day)
end

def print_list(week_by_day)
  week_by_day.each do |day, events|
    puts day.colorize(:blue)
    if !events.empty?
      events.map do |event|
        puts "#{event[:start_date]} - #{event[:end_date]} #{event[:title]} (#{event[:id]})"
      end
    else
      puts "No events"
    end
  end
end
