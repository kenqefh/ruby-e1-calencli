def update(id_event)
  return unless id_event.positive?

  event = reference_event_by_id(id_event)
  return if event.nil?

  event_temp = input_event[:h_event]
  event_temp[:id] = id_event
  event[:event] = event_temp
  delete(id_event)
  create_event({ year: event[:year], num_week: event[:week], h_event: event[:event] })
end

def reference_event_by_id(id_event)
  @events.each do |keya, weeks|
    weeks.each do |keyw, events|
      events.each { |event| return { event: event, year: keya, week: keyw } if event[:id] == id_event }
    end
  end
end

