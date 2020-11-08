require "date"
require_relative "data"
require "colorize"

require_relative "methods/create_event"
require_relative "methods/update_event"

require_relative "methods/list"
require_relative "methods/delete"

require_relative "methods/show"

# Variables
@concurrent_date = DateTime.now

def show_welcome
  puts "-----------------------------Welcome to CalenCLI------------------------------\n\n"
end

def show_calencli
  puts "#{'-' * 35}CalenCLI#{'-' * 35}\n\n"
end

# Menu
# We have added the "exit" option, because we wanted to terminate the program
# through this command
def menu
  puts "-" * 78
  puts "list | create | show | update | delete | next | prev | exit\n\n"
  print "action: "
  gets.chomp
end

# Get week and year
def get_year_week
  params = []
  params << @concurrent_date.year.to_s.to_sym
  params << @concurrent_date.cweek.to_s.to_sym
  params
end

def get_event_id
  print "Event ID: "
  gets.to_i
end

def update_concurrent_date(days)
  @concurrent_date += days
end

def restart_concurrent_date
  @concurrent_date = DateTime.now
end

# program
show_welcome
list(*get_year_week)
opcion = nil

until opcion == "exit"
  opcion = menu

  case opcion
  when "list"
    show_calencli
    restart_concurrent_date
    list(*get_year_week)

  when "create"
    event = input_event
    create_event(event)

  when "show"
    show(get_event_id)

  when "update"
    update(get_event_id)

  when "delete"
    delete(get_event_id)

  when "next"
    update_concurrent_date(7)
    show_calencli
    list(*get_year_week)

  when "prev"
    update_concurrent_date(-7)
    show_calencli
    list(*get_year_week)

  when "exit"
    puts "Bye!"

  else
    puts "Loading.."

  end
end
