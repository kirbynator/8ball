@answers = []
def start
puts "What question would you like to ask the ball?"
case = gets.strip.downcase
when "quit"
  puts "Come again"
  sleep 3
  print 'clear'
  exit
when "11"
  admin_mode
else 
responce = Random(@anwers.count)
puts "#{@answers[responce]}"
sleep 5
start
end
end
start