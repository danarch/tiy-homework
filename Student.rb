class Student
  def initialize (name)
    @name = name
  end

  def name
    @name
  end

  def name= new_name
    @name = new_name
  end

  def display_name(last, first, middle = nil)
    if middle
      "#{first} #{middle} #{last}"
    else
      "#{first} #{last}"
    end
  end
  
end
