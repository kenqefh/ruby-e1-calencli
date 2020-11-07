def update(id_event)
  return unless id_event.positive?

  event = reference_event_by_id(id_event)
  # p "event-- #{event}"
  return if event.nil?

  delete(id_event)
  event_temp = input_event
  event_temp[:h_event][:id] = id_event
  event = event_temp[:h_event]
  # p "update>>> ano: #{event_temp[:year]}, week: #{event_temp[:num_week]}, evento ##{event}"
  create_event({ year: event_temp[:year], num_week: event_temp[:num_week], h_event: event })
end

def reference_event_by_id(id_event)
  e = nil
  @events.each do |_, weeks|
    weeks.each do |_, events|
      events.each { |event| e = event if event[:id] == id_event }
      # p "e: #{event[:id]==id_event}"
    end
  end
  e
end
