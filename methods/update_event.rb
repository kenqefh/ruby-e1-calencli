def update(id_event)
  return unless id_event.positive?
  event = reference_event_by_id(id_event)
  return if event.nil?
  # p "event: #{event}"
  # update
  event_temp = input_event[:h_event]
  event_temp[:id] = id_event
  event[:event] = event_temp
  # p "event_modificado: #{event[:event]}"
  # delete event
  delete(id_event)
  # create event
  create_event({ year: event[:year], num_week: event[:week], h_event: event[:event] })
   p "anio: #{id_event} | anio: #{event[:year]} | eventfinal. #{ @events[event[:year]][event[:week]] }"
end

def reference_event_by_id(id_event)
  @events.each do | keya, weeks|
    weeks.each do |keyw, events|
      events.each { |event| return { event: event, year: keya, week: keyw } if event[:id] == id_event }
    end
  end
end

def find_event_by_id(id_event)
  @events.each do |_, weeks|
    weeks.each do |_, events|
      events.each { |event| return event if event[:id] == id_event }
    end
  end
end
