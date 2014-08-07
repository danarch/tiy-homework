class Widgets
  include Enumerable
  require "YAML"
  def initialize
    @data = YAML.load(File.read("widgets.yml"))
  end
  def each
    @data.each {|widget| yield widget}
  end
end

widgets = Widgets.new
priciest_widget = widgets.max_by {|hash| hash[:price]}
cheapest_widget = widgets.min_by {|hash| hash[:price]}
total_revenue = widgets.collect{|hash| hash[:price]*hash[:sold]}.reduce(:+)
total_expense = widgets.collect{|hash| hash[:cost_to_make]*hash[:sold]}.reduce(:+)
total_profit = total_revenue - total_expense
top_ten_widgets = widgets.sort_by{|hash| -hash[:sold]}.take(10)
sellsheet = widgets.group_by {|hash| hash[:department]}

puts "The priciest widget is the #{priciest_widget[:name]}"
puts "The cheapest widget is the #{cheapest_widget[:name]}"
puts "The total revenue is #{total_revenue}"
puts "The total profit is #{total_profit}"
puts "The top ten widgets sold are:"
top_ten_widgets.each_with_index do |hash, index|
  puts "#{index + 1}. #{hash[:name]}: #{hash[:sold]}"
end
sellsheet.each do |dept, wdgt|
  department = dept
  sold = wdgt.collect{|hash| hash[:sold]}.reduce(:+)
  puts "#{dept} sold #{sold}"
end
