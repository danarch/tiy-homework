require "./survey"
puts <<-istr
  Thank you for taking the time to complete this survey.
   Please rank the preceeding statements with a rating from
   1 to 5 of how well you agree with the statement. You will
   be allowed to edit any answers once you respond to each
   statement.
      istr

srvy = Survey.new

Statements.each do |x|
  puts x
  puts "1. Strongly Disagree"
  puts "2. Slightly Disagree"
  puts "3. Neither Agree nor Disagree"
  puts "4. Slightly Disagree"
  puts "5. Strongly Agree"
  userans = gets.chomp.to_i
  srvy.agree(Statements.index(x)+1, userans)
 end

puts "You gave the following answers to this survey, do you wish"
puts "to edit any of your answers? Yes/No"
srvy.answers.each do |q, a|
  puts "#{q}. #{a}"
 end
edt = gets.chomp
until edt == "No" do
  puts "What question do you want to edit?"
  quest = gets.chomp.to_i
  puts Statements[quest - 1]
  puts "1. Strongly Disagree"
  puts "2. Slightly Disagree"
  puts "3. Neither Agree nor Disagree"
  puts "4. Slightly Disagree"
  puts "5. Strongly Agree"
  ans = gets.chomp.to_i
  srvy.edit(quest, ans)
  puts "Your answers have been edited to the following, is there"
  puts "another answer you'd like to change? Yes/No"
  srvy.answers.each do |q, a|
    puts "#{q}. #{a}"
  end
  edt = gets.chomp
end
srvy.submit
puts "Thank you for your input. You gave an average response of"
puts "#{srvy.avg} with a minimum of #{srvy.min} and maximum #{srvy.max}"
