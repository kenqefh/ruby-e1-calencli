def delete(id_event)
  # validation in case id_event does not positive, then it goes out from method
  return unless id_event.positive?

  @events.each do |_, weeks|
    weeks.each do |_, events|
      events.delete_if { |event| event[:id] == id_event }
    end
  end
end
