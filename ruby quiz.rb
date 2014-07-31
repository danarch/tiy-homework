Questions = [
  {question: "What is the capital of GA?",
    choices: ["Atlanta","Augusta", "Helen", "Alpharetta"],
    answer: 1
  },
  {question: "What is the capital of FL?",
    choices: ["Orlando","Miami", "Tampa", "Jackson"],
    answer: 4
  },
  {question: "What is the capital of AL?",
    choices: ["Birmingham","Mobile", "Macon","Tuscaloosa"],
    answer: 2
  },
  {question: "What is the capital of NY?",
    choices: ["New York", "Albany", "Buffalo", "Syracuse"],
    answer: 2
  },
]

class Quiz
  def initialize
    @score = 0
    @answers = Hash.new
  end

  def askquest(qset, num)
    puts qset[num][:question]
    puts qset[num][:choices]
    userans = gets.chomp
    @answers[num.to_sym] = userans
    @score += 1 if userans == qset[num][:choices][qset[num][:answer]]
  end

  def takequiz
    questions = Questions.shuffle
    questions.each_index { |i| self.askquest(questions, i)}
    puts @score.to_s
    puts @answers.to_s
  end
end
