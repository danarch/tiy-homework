#Define a function to find the hypotenuse of a right triangle with side lengths a and b
def hypoteneuse(a,b)
  return Math::sqrt((a**2)+(b**2))
end

#Alternatively this can be written with the built in hypot method
def hypot(a,b)
  return Math.hypot(a,b)
end

# What methods do strings have that symbols don't? Describe a few. What methods do symbols have that strings don't?

=begin
 Strings can be added together with '+' and repeated with '*', among other methods that can add, remove,
 or rearrange the characters of the string (e.g. chop, dump,sub, insert, reverse, split, etc.). The method each_char
 shows how a string can act almost as a one dimensional array of the characters as elements. Symbols on the other hand
 only have two methods not defined for strings, pretty-print-cycle and to_proc.
=end

#Why doesn't Fixnum.new work?

=begin
 Fixnum, as well as Integer, Bignum, and Float are derived from the Numeric class,
 which are defined in Ruby as immutable values and so cannot be copied to multiple
 instances. Ruby is a "duck typing" language, so objects are defined by the methods
 and operations that can be done on them, as opposed to the class they belong to.
 The Numeric (and Symbol) literals are immediate values rather than object references.
=end

#Write code using methods on at least one number, string, symbol, array and hash. Make a gist from the code.
 class Char_in_Text
   def initialize text
     @text = text
   end
  def total    #make an array of each character in name,
                #and perform the uniq method to remove duplicates
    @arr = @text.each_char(&:to_s)
    @letters = @arr.uniq!
    print "There are #{@letters.count} distinct letters in this text."
  end
  def frequency
    #make a hash of the number of times each character in name
   @freq = Hash.new(0)
     @letters.each do |x|
       @freq[x] += 1
     end
    @freq.each do |letter, count|
    puts letter + " " + count.to_s
  end
end
#Define Musher class such that Musher.new("+").mush(["array", "of", "strings"]) == "array + of + strings"
class Musher
  def initialize delimit
    @delimit = delimit
  end
  def mush(array)
    return array * " #{@delimit} "
  end
end


Musher.new("+").mush(["array", "of","strings"])

#Define an Averager class that can compute the average of two numbers. Bonus: any number of numbers.
   class Averager

     def self.avg(a,b)
       return ((a+b)/2.0)
     end
     def self.avgs(*nums)
       tot = nums.reduce :+ #reduce
       cnt = nums.count
       return tot.fdiv(cnt)
     end
   end


#Write a script to read list of lines from a file and print one at random
def slct *names
  print names.sample
end
