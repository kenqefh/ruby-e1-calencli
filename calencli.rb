require "date"
require_relative "data"
require "colorize"

# Impot Ro
require_relative "methods/create_event"
# Import An

# import Fr
require_relative "methods/list"

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
    week_munber = DateTime.now.cweek.to_s.to_sym
    # week_munber = :"47"
    year = DateTime.now.year.to_s.to_sym
    list(year, week_munber)

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
