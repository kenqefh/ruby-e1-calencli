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
  DateTime.new(dates[:year], dates[:mon], dates[:mday], time[0], time[1], 0)
end

def get_start_end_time(start_end)
  if !start_end.empty?
    horas = start_end.split(" ")
    # rubocop:disable Style/SymbolProc
    start_time = horas[0].split(":").map { |h| h.to_i }
    end_time = horas[1].split(":").map { |h| h.to_i }
    # rubocop:enable Style/SymbolProc
  else
    start_time = 0
    end_time = 0
  end

  [start_time, end_time]
end

def validate_format_time
  print "start_end: ".rjust(15, " ")
  start_end = gets.chomp
  until start_end.length == 11 || start_end.empty?
    puts "Format: 'HH:MM HH:MM' or leave it empty"
    print "start_end: ".rjust(15, " ")
    start_end = gets.chomp
  end
  start_end
end

def validate_hour(dates)
  valid = false
  until valid == true
    start_end = validate_format_time
    start_end_time = get_start_end_time(start_end)
    start_date = get_date_time(dates, start_end_time[0])
    end_date   = get_date_time(dates, start_end_time[1])
    valid = validate_hour_compare(start_date, end_date)
  end
  [start_date, end_date]
end
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
  date_start_end = validate_hour(dates)
  ## notes = input_date("notes",false)
  guests = input_date_guests
  # year = date_start_end[0].year.to_s # se puede optimizar decalrando defrente en el hash de salida
  # num_week = date_start_end[0].cweek.to_s # Numero de semana
  # p "start_end: #{start_end} , num_week: #{num_week}"
  hash_event = { id: @id += 1, start_date: date_start_end[0], title: "Prueba",
                 calendar: "tech", end_date: date_start_end[1], notes: "", guests: guests }
  { year: current_year(date_start_end[0]), num_week: current_week(date_start_end[0]), hash_event: hash_event }
end

def create_event
  event = input_event
  # p "Event:: #{event}"
  if @events.key?(:"#{event[:year]}")
    if @events[:"#{event[:year]}"].key?(:"#{event[:num_week]}")
      @events[:"#{event[:year]}"][:"#{event[:num_week]}"].push(event[:hash_event])
      # puts "@events--> #{ @events[:"#{event[:year]}"]}"
      # puts "@events--> #{ @events[:"#{event[:year]}"][:"#{event[:num_week]}"] }"
    else
      @events[:"#{event[:year]}"][:"#{event[:num_week]}"] = event[:hash_event]
      # puts "@events--> #{ @events[:"#{event[:year]}"]}"
      # puts "@events--> #{ @events[:"#{event[:year]}"][:"#{event[:num_week]}"] }"
      # puts "Se creo nueva semana"
    end
  else
    # @events[:"#{year}"] =  "se creo el anio"
    # array = [event[2]]
    @events[:"#{event[:year]}"] = { "#{event[:num_week]}": event[:hash_event] }
    # puts "@events--> #{ @events[:"#{event[:year]}"]}"
    # puts "@events--> #{ @events[:"#{event[:year]}"][:"#{event[:num_week]}"] }"
  end
  # puts "@events--> #{ @events[:"#{event[:year]}"]}"
  # puts "@events--> #{ @events[:"#{event[:year]}"][:"#{event[:num_week]}"] }"
end

# rubocop:enable Metrics/AbcSize
