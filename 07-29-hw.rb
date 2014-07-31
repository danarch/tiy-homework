=begin
1. Get Ruby koans running. Do as many as you can / need to.
2. Watch this video on pry and follow along - http://vimeo.com/26391171
3. Share any beginner resources that you've used and found helpful on Basecamp

4. Update your bash prompt (using export PS1=...) to at least include the present
   working directory (\d). See mine for a reference.
   - Bonus - go nuts. Some ideas: include a timestamp, display a red x if the last
    command failed, include the number of files in the current directory, show what
    git branch you're on.

5. Write a method grade that takes in a numerical grade 1-100 and prints out the letter
   version of it.
6. Write a function that produces an array of random scores: students(5) = [88, 93, 91, 73, 97]
7. Compute the grades for a class of 25 students. Write a function to determine how many A's
   there were.

8. Write a number guessing game
    The computer should pick a random number
    The player guesses, and the computer says if the guess is high or low
    Play proceeds until the player gets the number or runs out of guesses
    Bonus: reverse the game (so the player chooses and the computer guesses).
    What's the best strategy for the computer? Can you define others?

9. Write a shopping cart class that stores any number of items
    Users should be able to add and remove items from the cart
    The cart should be able to compute the total checkout price, after applying tax
    Shoppers get a 10% discout if they spend more than $100 (before tax)

10. Design a hangman game.
    Write out everything that the game should do
    Bonus - (start to) code it up

=end

#5.
def grade(num)
  if num < 0.0 || num > 100.0
    "Please give a grade out of 100."
  elsif num < 60.0
    "F"
  elsif num < 70.0
    "D"
  elsif num < 80.0
    "C"
  elsif num < 90.0
    "B"
  elsif num <= 100.0
    "A"
  else
    "Please provide a numeric grade."
  end
end

#6.
def grades(num_sts)
  grades = Array.new
  num_sts.times do
    r = Random.new
    grades << r.rand(100.0)
  end
   return grades
end

#7.
def student_grades(num_sts)
  gradebook = Hash.new(0)
  student_scores = grades(num_sts)
  student_scores.each do |score|
    letter_grade = grade(score)
    gradebook[letter_grade] += 1
  end
  puts gradebook
  puts "#{gradebook["A"]} many A's"
end

#8. see game_spec.rb, game_script.rb, and guessinggame.rb

#9.
Inventory = {apple: 0.75, banana: 0.99, orange: 1.15, pear: 0.60}
class ShoppingCart
  def initialize
    @contents = Hash.new(0)
  end

  def add(item)
    unless Inventory.include?(item)
      raise "We don't carry that item."
    end
    @contents[item] += 1
  end

  def remove(item)
    unless @contents[item] > 0
      raise "You don't have any #{item} in your cart"
    end
    @contents[item] -= 1
  end

  def subtotal
    sub = 0
    @contents.each do |item, qnty|
      cost = Inventory[item]
      sub += cost * qnty
    end
    sub
  end

  def total
    sub = subtotal
    sub = 0.9 * sub if sub >= 100
    sub * 1.07
  end
end
