# this method return the array by id example :
# give id: 1 , return [id:1 , start_date : "12:00"....]
@format_date = "%F"
@justify_step = 12
@date = "date"
def find_by_id(id)
  @events.each_value do |weeks|
    weeks.each_value do |events|
      events.each do |item_events|
        return item_events if item_events[:id] == id
      end
    end
  end
  ""
end

# begin this method jusfify the text with the number of space you give example:
# print_key("angel",12) result to "      angel"
# end.

def print_key(key, just_space)
  key_formatted = key.rjust(just_space, " ")
  print key_formatted.colorize(:blue)
end

# this method return format hours example :
# print_value(2020-11-03T13:30:00+00:00) result 13:30

def print_value(value)
  if value.is_a?(Date)
    value.strftime("%H:%M")
  else
    value
  end
end

# this method find and print a event by id example
# show(2) return print :
#   Event ID :2
#         id : 2
# start_date : 12:00
#      title : English Course B1
#   calendar : english
#   end_date : 13:30
#      notes :
# guests : ["Stephanie", "Patricia"]

def show(id)
  data_select = find_by_id(id)
  if data_select == ""
    ""
  else
    puts "#{print_key(@date, @justify_step)} : #{data_select[:start_date].strftime(@format_date)}"
    data_select.each do |x, y|
      puts "#{print_key(x.to_s, 12)} : #{print_value(y)}" if x != :id
    end
  end
end
