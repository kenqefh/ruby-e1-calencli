# rubocop:disable Metrics/AbcSize

def current_week(date)
  date.year
end

def current_year(date)
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

def date_time(dates, time)
  # p ">>entro a date_time :: #{dates}"
  DateTime.new(dates[:year], dates[:mon], dates[:mday], time[0], time[1], 0)
end

# def validate_hour_compare(start_date, end_date)
#  p "validatehourcompare: #{start_date}"
#    if start_date <= end_date
#      valid = true
#      puts "se valido fechas"
#    else
#      print"Cannot end before start\nstart_end: "
#      start_end = gets.chomp
#      # puts "vali: #{valid}"
#      valid = false
#    end
#  [valid, start_end]
# end

def validate_format(start_end)
  until start_end.length == 11 || start_end.empty?
    print "Format: 'HH:MM HH:MM' or leave it empty\nstart_end: "
    start_end = gets.chomp
  end
  start_end
end

# rubocop:disable Metrics/MethodLength
def validate_hour(dates, start_end)
  valid = false
  until valid == true
    start_end = validate_format(start_end)
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
    start_date = date_time(dates, start_time)
    end_date   = date_time(dates, end_time)
    # valid = validate_hour_compare(start_date, end_date)[0]
    # start_end = validate_hour_compare(start_date, end_date)[1]# NOS QUEDAMOS ACA BUSCANDO VALIDAR las hroas
    # p "valid: #{valid}"
    if start_date <= end_date
      valid = true
      puts "se valido fechas"
    else
      print "Cannot end before start\nstart_end: "
      start_end = gets.chomp
      # puts "vali: #{valid}"
      # valid = false
    end
  end
  [start_date, end_date]
end
# rubocop:enable Metrics/MethodLength

def input_date(input_date, checker)
  label = input_date
  print "#{label}: "
  input_date = gets.chomp
  while input_date == "" && checker
    print "Cannot be blank\n#{label}: "
    # print "title: "
    input_date = gets.chomp
  end
  input_date
end

def input_event
  # validar_date
  date = input_date("date", false)
  dates = validate_date(date)
  # p "datess: #{dates}"
  ## title = input_date("title",true)
  ## calendar = input_date("calendar",false)
  # validar hora
  print "start_end: "
  start_end = gets.chomp
  date_start_end = validate_hour(dates, start_end)
  # p date_start_end
  ## notes = input_date("notes",false)
  ## guests = input_date("guests",false)
  num_week = date_start_end[0].cweek.to_s # Numero de semana
  year = date_start_end[0].year.to_s
  # p "start_end: #{start_end} , num_week: #{num_week}"
  hash = { id: @id.next, start_date: date_start_end[0], title: "Prueba",
           calendar: "tech", end_date: date_start_end[1], notes: "", guests: "" }
  # [num_week: num_week, year: year, hash: hash]
  [year, num_week, hash]
end

def create_event
  event = input_event
  # p "evetn::: #{event}"
  # p " #{event}"
  # p "event[yea.._>] : #{event[2]}"
  if @events.key?(:"#{event[0]}")
    if @events[:"#{event[0]}"].key?(:"#{event[1]}")
      @events[:"#{event[0]}"][:"#{event[1]}"].push(hash)
      # puts @events[:"#{year}"][:"#{num_week}"]
    else
      @events[:"#{event[0]}"][:"#{event[1]}"] = event[2]
      # puts @events[:"#{event[0]}"][:"#{event[1]}"]
      # puts "Se creo nueva semana"
    end
  else
    # @events[:"#{year}"] =  "se creo el anio"
    @events[:"#{event[0]}"] = [:"#{event[1]}"].push(event[2])
    # puts "Se creo anio:  #{@events[:"#{event[0]}"]} "
  end
end

# rubocop:enable Metrics/AbcSize
