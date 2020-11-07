require "date"
require_relative "data"
require "colorize"

# Impot Ro
require_relative "methods/create_event"
# Import An

# import Fr
require_relative "methods/list"
require_relative "methods/delete"

# Variables
@concurrent_date = DateTime.now

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
    week_munber = @concurrent_date.cweek.to_s.to_sym
    year = @concurrent_date.year.to_s.to_sym
    list(year, week_munber)

  when "create"
    create_event
    # menu
  when "show"
    menu

  when "update"
    menu

  when "delete"
    print "Event ID: "
    delete(gets.chomp.to_i)

  when "next"
    @concurrent_date += 7
    week_munber = @concurrent_date.cweek.to_s.to_sym
    year = @concurrent_date.year.to_s.to_sym
    list(year, week_munber)

  when "prev"
    @concurrent_date -= 7
    week_munber = @concurrent_date.cweek.to_s.to_sym
    year = @concurrent_date.year.to_s.to_sym
    list(year, week_munber)

  when "exit"
    menu

  else
    menu

  end
end
