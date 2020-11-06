require "date"
require_relative "data"
require "colorize"

# Impot Ro
require_relative "methods/list"
# Import An

# import Fr

# Menu
def menu
  puts "list | create | show | update | delete | next | prev | exit"
  gets.chomp
end

opcion = nil
until opcion == "exit"
  opcion = menu

  case opcion
  when "list"
    week_munber = DateTime.now.cweek.to_s.to_sym
    year = DateTime.now.year.to_s.to_sym
    list(year, week_munber)

  when "create"
    menu

  when "show"
    menu

  when "update"
    menu

  when "delete"
    menu

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
