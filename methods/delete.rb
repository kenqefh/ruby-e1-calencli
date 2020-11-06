def delete(id_event)
  # validation in case idevent == 0, then it goes out from method
  return if id_event.zero?

  @events.each do |_, weeks|
    weeks.each do |_, events|
      events.delete_if { |event| event[:id] == id_event }
    end
  end
end
