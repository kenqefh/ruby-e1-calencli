require "date"
require_relative "data"
require "colorize"

# Impot Ro

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
    puts "1"

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
