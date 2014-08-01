Statements = ["This is a statement", "This is a survey", "This is getting weird", "this is a bit too meta"]

class Survey
  attr_reader :answers, :numstmts
  def initialize
    @submitted = false
    @answers = Hash.new
  end

  def agree(stmt, ans)
    @answers.store(stmt, ans)
  end

  def edit(stmt, newans)
    @answers.store(stmt, newans) if Statements.size == @answers.size
  end
  def submit
    @submitted = true if Statements.size == @answers.size
  end
  def finished?
    @submitted
  end
  def avg
    if @submitted
      tot = @answers.values.reduce :+ #reduce
      cnt = @answers.count
      return tot.fdiv(cnt)
    end
  end
  def max
    if @submitted
      @answers.values.max
    end
  end
  def min
    if @submitted
      @answers.values.min
    end
  end
end
