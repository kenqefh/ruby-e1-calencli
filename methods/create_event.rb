def create_event
  print "date: "
  date = gets.chomp
  dates = Date._strptime(date, "%Y-%m-%d") # SE MODIFICO RUBOCOP
  # p "dats:#{dates.nil?}"
  while dates.nil?
    puts "Type a valid date: YYYY-MM-DD"
    print "date: "
    date = gets.chomp
    dates = Date._strptime(date, "%Y-%m-%d")
  end
  print "title: "
  title = gets.chomp
  while title == ""
    puts "Cannot be blank"
    print "title: "
    title = gets.chomp
  end

  # rint "calendar: "
  # calendar = gets.chomp

  print "start_end: "
  start_end = gets.chomp
  valid = false
  until valid == true
    if start_end.length == 11 || start_end.empty?
      if !start_end.empty?
        horas = start_end.split(" ")
        start_time = horas[0].split(":").map { |h| h.to_i }
        end_time = horas[1].split(":").map { |h| h.to_i }
      else
        start_time = 0
        end_time = 0
      end
      start_date = DateTime.new(dates[:year], dates[:mon], dates[:mday], start_time[0], start_time[1], 0)
      end_date   = DateTime.new(dates[:year], dates[:mon], dates[:mday], end_time[0], end_time[1], 0)
      # p "start_date: #{start_date} -  #{end_date}, start_time_end: #{start_time}  -  #{end_time} "
      if start_date <= end_date
        valid = true
        puts "se valido fechas"
      else
        puts "Cannot end before start"
        print "start_end: "
        start_end = gets.chomp
        # puts "vali: #{valid}"
      end
    else
      until start_end.length == 11 || start_end.empty?
        puts "Format: 'HH:MM HH:MM' or leave it empty"
        print "start_end: "
        start_end = gets.chomp
      end
    end
  end

  num_week = start_date.cweek.to_s # Numero de semana
  p "start_end: #{start_end}, start_date: #{start_time}  : #{end_time} , num_week: #{num_week}"

  hash = { id: @id.next, start_date: start_date, title: "Prueba",
          calendar: "tech", end_date: end_date, notes: "", guests: "" }
  # ingresando dato
  # puts @events[:"2020"].key?(:"#{num_week}")
  # puts "::: #{@events[:"2020"][:"#{num_week}"]}"
  if @events[:"2020"].key?(:"#{num_week}")
    @events[:"2020"][:"#{num_week}"].push(hash)
    puts @events[:"2020"][:"#{num_week}"]
  else
    @events[:"2020"][:"#{num_week}"] = hash
    puts @events[:"2020"][:"#{num_week}"]
    puts "Se creo nueva semana"
  end
  # @events[:"2020"][:"45"].push(hash)
end