# this method return the array by id example :
# give id: 1 , return [id:1 , start_date : "12:00"....]

def find_by_id(id)
  @events.each_value do |weeks|
    weeks.each_value do |events|
      events.each do |item_events|
        item_events.each_value do |item|
          return item_events if item == id
        end
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
  just_space = 12
  if data_select != ""
    data_select.each do |x, y|
      puts "#{print_key(x.to_s, just_space)} : #{print_value(y)}"
    end
  else
    ""
  end
end
