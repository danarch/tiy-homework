=begin
_Courtesy reminder: headshots are tomorrow_

### Github

Add your previous homework to your homework repo and
push it to Github

### 0. Koans

Continue on the path to enlightenment. It is a long road.

### 0.5 Guessing Game Spec

Finish the last spec in the guessing game. Any other improvements to make?

### 1. Code Review

Take a look over the other class members' homework
from yesterday. Find a solution you don't understand
(either a problem you struggled with, or a solution
that is significantly different from yours), and talk
that problem over with its author. What did you learn
from their approach?

### 2. Quiz

You should be able to specify questions (~5-10) like so:

```
# Preferably something with better answers ...
Questions = [
  {
     question: "Why did the chicken cross the road?",
     choices: [
       "Why does anyone do anything?",
       "To get to the other side",
       "Something something something YOUR MOM",
       "Mu"
     ],
     answer: 1
  },
  {
    question: "...",
    ...
  }
]
```

Then running `ruby quiz.rb` should display the questions
one at a time in random order, ask the user for input,
and display their score when done. Bonus: display which
questions the user got right / wrong with answers at the
end.

### 3. Letter counter

Write a letter counter that takes a string and returns
a hash showing how many times each letter shows up in
that strings. Bonus: how many t's are in this file?

### 4. Test-drive the Hangman Game
=end

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

#3.
class Char_in_Text
  def initialize text
    @text = text
    @arr = @text.each_char.to_a
  end
 def total
   print "There are #{@arr.count} distinct letters in this text."
 end
 def frequency
   #make a hash of the number of times each character in name
  @freq = Hash.new(0)
    @arr.each do |x|
      @freq[x] += 1
    end
  @freq = @freq.sort_by {|a, b| b}
  @freq.reverse!
  @freq.each do |letter, count|
  puts letter + " " + count.to_s
  end
 end
end
