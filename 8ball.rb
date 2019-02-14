@answers = ["yes", "no", "maybe", "if you believe"]
@extraAnswers = []
def start
puts "What question would you like to ask the ball?"
case gets.strip.downcase
when "quit"
  puts "Come again"
  sleep 3
  print 'clear'
  exit
when "add_answers"
  puts "What answer would you like to add?"
  @answers << gets.strip
  puts "#{@answers.last} has been added"
  sleep 1
  start
when "reset_answers"
  @extraAnswers = []
  puts "Answers reset"
  sleep 1
  start
when"print_answers"
  @answers.each_with_index do |awnser, index|
    puts "#{index + 1}) #{answer}"
    sleep 1
    start
    end
else 
  @answers << @extraAnswers
  @answers.flatten!
prng = Random.new
responce = prng.rand(@answers.count)
puts "#{@answers[responce]}"
sleep 5
start
end
end

start