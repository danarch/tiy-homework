Questions = [
  {question: "What is the capital of the GA?",
    choices: ["Atlanta","Helen", "Savannah", "Canton"],
    answer: 1
  },
  {question: "What is the capital of FL?",
    choices: ["Orlando","Tampa", "Miami", "Jacksonville"],
    answer: 4
  },
  {question: "What is the capital of AL?",
    choices: ["Birmingham","Mobile", "Macon","Tuscaloosa"],
    answer: 2
  },
  {question: "What is the capital of NY?",
    choices: ["New York", "Albany", "Buffalo", "Syracuse"],
    answer: 2
  }
]

class Quiz
  def initialize
    @score = 0
    @answers = Hash.new
  end

  def askquest(quest, num)
    puts quest[:question]
    i = 1
    quest[:choices].each do |choice|
      puts "#{i}. #{choice}"
      i+= 1
    end
    userans = gets.chomp.to_i
    @answers[num] = [userans, quest[:choices][:answer]]
    if userans == quest[:answer] + 1
      puts "That's correct!"
      @score += 1
    else
      puts "That is incorrect :("
    end
  end

  def takequiz
    questions = Questions.shuffle
    questions.each do |cur_q|
      askquest(cur_q, questions.index(cur_q))
    end
    puts @score.to_s
    puts @answers.to_s
  end
end
