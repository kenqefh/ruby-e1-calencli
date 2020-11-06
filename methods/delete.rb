def delete(id_event)
  @events.each do |_, weeks|
    weeks.each do |_, events|
      events.delete_if { |event| event[:id] == id_event }
    end
  end
end
