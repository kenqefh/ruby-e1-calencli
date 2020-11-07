def update(id_event)
  return unless id_event.positive?

  event = reference_event_by_id(id_event)
  return if event.nil?

  delete(id_event)
  event_temp = input_event
  event_temp[:h_event][:id] = id_event
  event = event_temp[:h_event]
  create_event({ year: event_temp[:year], num_week: event_temp[:num_week], h_event: event })
end

def reference_event_by_id(id_event)
  @events.each do |keya, weeks|
    weeks.each do |keyw, events|
      events.each { |event| return { event: event, year: keya, week: keyw } if event[:id] == id_event }
    end
  end
end
