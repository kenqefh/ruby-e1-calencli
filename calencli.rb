require "date"
require_relative "data"
require "colorize"

# Impot Ro
require_relative "methods/create_event"
# Import An

# import Fr

# Menu
def menu
  puts "list | create | show | update | delete | next | prev | exit"
  print "action: "
  gets.chomp
end

# def create_events

# end

opcion = nil
until opcion == "exit"
  opcion = menu

  case opcion
  when "list"
    puts "1"

  when "create"
    create_event
    # menu
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
