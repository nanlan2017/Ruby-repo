def event(description,&block)
  puts "ALERT: #{description}" if yield
end

# test
event 'we are own too much money' do
  recent_order = 100
  recent_order > 60
end