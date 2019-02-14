require "pry"
require "colorize"
class Ball8
  def initialize
@extraAnswers = []
@defaltAnswers = ["yes", "no", "maybe", "if you believe"]
start
  end
def start
   @answers = @defaltAnswers
puts "What question would you like to ask the ball?"

case gets.strip.downcase
  when "quit"
    puts "🎱  > Come again".colorize(:blue)
    sleep 1
    print 'clear'
    exit
  when "add_answers"
    add_answers
    start
  when "reset_answers"
    reset_answers
    start
  when "print_answers"
    print_answers
    start
  when "11"
    admin_mode
    start
  else 
    @answers << @extraAnswers
    @answers.flatten!
  # binding.pry
    prng = Random.new
    responce = prng.rand(@answers.count)
    puts "🎱  > #{@answers[responce]}".colorize(:blue)
    sleep 1
    start
  end
end

def add_answers
  puts "What answer would you like to add?".colorize(:red)
  @extraAnswers << gets.strip
  puts "#{@extraAnswers.last} has been added".colorize(:red)
  sleep 1
end

def reset_answers
  @extraAnswers = []
  puts "Answers reset".colorize(:red)
  sleep 1
end

def print_answers
  @defaltAnswers.each_with_index do |answer, index|
    puts "#{index + 1}) #{answer}"
  end
  @extraAnswers.each_with_index do |answer, index|
      puts "#{index + 1 + @defaltAnswers.count}) #{answer}"
    end
  end

def admin_mode
  puts
puts "1) add answer".colorize(:red)
puts "2) reset answers".colorize(:red)
puts "3) print answers".colorize(:red)
puts "4) exit".colorize(:red)
print "> ".colorize(:red)
  case gets.to_i
    when 1
      add_answers
      admin_mode
    when 2
      reset_answers
      admin_mode
    when 3
      print_answers
      admin_mode
    when 4
      puts
      start
    else 
      puts "error: unknown imput".colorize(:red)
      admin_mode
  end
end
end

Ball8.new
