def update(id_event)
  return unless id_event.positive?

  event = find_event_by_id(id_event)
  return if event.nil?

  
end

def find_event_by_id(id_event)
  @events.each do |_, weeks|
    weeks.each do |_, events|
      events.each { |event| return event if event[:id] == id_event }
    end
  end
  return nil
end
