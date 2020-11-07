# rubocop:disable Metrics/AbcSize

def current_year(date)
  date.year
end

def current_week(date)
  date.cweek
end

def validate_date(date)
  dates = Date._strptime(date, "%Y-%m-%d")
  while dates.nil?
    print "Type a valid date: YYYY-MM-DD\ndate: "
    date = gets.chomp
    dates = Date._strptime(date, "%Y-%m-%d")
  end
  dates
end

# Start Validator Hour
def validate_hour_compare(start_date, end_date)
  if start_date <= end_date
    valid = true
    puts "se valido fechas"
  else
    puts "Cannot end before start "
    # start_end = gets.chomp
    # puts "vali: #{valid}"
    valid = false
  end
  valid
end

def get_date_time(dates, time)
  if time.empty?
    DateTime.new(dates[:year], dates[:mon], dates[:mday])
  else
    DateTime.new(dates[:year], dates[:mon], dates[:mday], time[0], time[1], 0)
  end
end

def get_date_start_end(dates, start_end)
  horas = start_end.split(" ")
  # rubocop:disable Style/SymbolProc
  start_time = horas[0].split(":").map { |h| h.to_i }
  end_time = horas[1].split(":").map { |h| h.to_i }
  # rubocop:enable Style/SymbolProc
  start_date = get_date_time(dates, start_time)
  end_date = get_date_time(dates, end_time)
  [start_date, end_date]
end

def get_format_time_validate
  print "start_end: ".rjust(15, " ")
  start_end = gets.chomp
  until start_end.length == 11 || start_end.empty?
    puts "Format: 'HH:MM HH:MM' or leave it empty"
    print "start_end: ".rjust(15, " ")
    start_end = gets.chomp
  end
  start_end
end

# rubocop:disable Metrics/MethodLength
def validate_hour(dates)
  valid = false
  until valid == true
    start_end = get_format_time_validate
    if start_end == ""
      start_end_date = [get_date_time(dates, ""), ""]
      valid = true
    else
      start_end_date = get_date_start_end(dates, start_end)
      valid = validate_hour_compare(start_end_date[0], start_end_date[1]) # True or False
    end
  end
  { start_date: start_end_date[0], end_date: start_end_date[1] }
end
# rubocop:enable Metrics/MethodLength
# End Validator Hour

def input_date_guests
  guest = input_date("guests", false)
  # rubocop:disable Style/SymbolProc
  guest.split(",").map { |g| g.strip }
  # rubocop:enable Style/SymbolProc
end

def input_date(input_date, checker)
  label = input_date
  print "#{label}: ".rjust(15, " ")
  input_date = gets.chomp
  while input_date == "" && checker
    print "Cannot be blank\n#{label}: ".rjust(15, " ")
    # print "title: "
    input_date = gets.chomp
  end
  input_date
end

def input_event
  date = input_date("date", false)
  dates = validate_date(date)
  ## title = input_date("title",true)
  ## calendar = input_date("calendar",false)
  d_start_end = validate_hour(dates)
  ## notes = input_date("notes",false)
  guests = input_date_guests

  h_event = { id: @id += 1, start_date: d_start_end[:start_date], title: "Prueba",
              calendar: "tech", end_date: d_start_end[:end_date], notes: "", guests: guests }
  { year: current_year(d_start_end[:start_date]), num_week: current_week(d_start_end[:start_date]), h_event: h_event }
end

def create_event
  event = input_event
  # p "Event:: #{event}"
  if @events.key?(:"#{event[:year]}")
    if @events[:"#{event[:year]}"].key?(:"#{event[:num_week]}")
      @events[:"#{event[:year]}"][:"#{event[:num_week]}"].push(event[:h_event])
    else
      @events[:"#{event[:year]}"][:"#{event[:num_week]}"] = event[:h_event]
    end
  else
    @events[:"#{event[:year]}"] = { "#{event[:num_week]}": event[:h_event] }
  end
  # puts "@events--> #{ @events[:"#{event[:year]}"]}"
  # puts "@events--> #{ @events[:"#{event[:year]}"][:"#{event[:num_week]}"] }"
end

# rubocop:enable Metrics/AbcSize
