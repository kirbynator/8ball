require "pry"
@extraAnswers = []
@defaltAnswers = ["yes", "no", "maybe", "if you believe"]
def start
   @answers = @defaltAnswers
puts "What question would you like to ask the ball?"

case gets.strip.downcase
  when "quit"
    puts "Come again"
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
    puts "#{@answers[responce]}"
    sleep 1
    start
  end
end

def add_answers
  puts "What answer would you like to add?"
  @extraAnswers << gets.strip
  puts "#{@extraAnswers.last} has been added"
  sleep 1
end

def reset_answers
  @extraAnswers = []
  puts "Answers reset"
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
puts "1) add answer"
puts "2) reset answers"
puts "3) print answers"
puts "4) exit"
print "> "
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
      start
    else 
      puts "error: unknown imput"
      admin_mode
  end
end
start