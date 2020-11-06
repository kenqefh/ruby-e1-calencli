require "date"
require_relative "data"
require "colorize"

# Impot Ro

# Import An

# import Fr
require_relative "methods/list"
require_relative "methods/delete"

# Menu
def menu
  puts "list | create | show | update | delete | next | prev | exit"
  print "action: "
  gets.chomp
end

opcion = nil
until opcion == "exit"
  opcion = menu

  case opcion
  when "list"
    week_munber = DateTime.now.cweek.to_s.to_sym
    # week_munber = :"47"
    year = DateTime.now.year.to_s.to_sym
    list(year, week_munber)

  when "create"
    menu

  when "show"
    menu

  when "update"
    menu

  when "delete"
    print "Event ID: "
    delete(gets.chomp.to_i)

  when "next"
    menu

  when "prev"
    menu

  when "exit"
    menu

  else
    menu

  end
end
