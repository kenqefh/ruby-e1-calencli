def find_by_id(id)
  @events.each do |_, week|
    week.each do |_, even|
      even.each do |eee|
        eee.each do |_, y|
          return eee if y == id
        end
      end
    end
  end
end

def print_key(key, just_space)
  key_formatted = key.rjust(just_space, " ")
  print key_formatted.colorize(:blue)
end

def print_value(value)
  if value.is_a?(Date)
    value.strftime("%H:%M")
  else
    value
  end
end

def show(id)
  data_select = find_by_id(id)
  just_space = 12
  data_select.each do |x, y|
    puts "#{print_key(x.to_s, just_space)} : #{print_value(y)}"
  end
end
