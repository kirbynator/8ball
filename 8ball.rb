@answers = ["yes", "no", "maybe", "if you believe"]
def start
puts "What question would you like to ask the ball?"
case gets.strip.downcase
when "quit"
  puts "Come again"
  sleep 3
  print 'clear'
  exit
when "11"
  admin_mode
else 
prng = Random.new
responce = prng.rand(@answers.count)
puts "#{@answers[responce]}"
sleep 5
start
end
end
def admin_mode
puts "1) Add a answer"
puts "2) See all answers"
case gets.to_i
when 1
  puts "What answer would you like to add?"
  @answer << gets.strip
  puts 
end 
start