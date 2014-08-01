require "minitest/autorun"

require "./survey"

describe(Survey) do
  it "is finished when the answer is submited" do
    srvy = Survey.new
    assert !srvy.finished?
  end
  it "lets users rate their agreement to a statement" do
    srvy = Survey.new
    srvy.agree(1, 4)
    assert srvy.answers[1] == 4
  end
  it "lets the user edit an answer if all statements have been answered" do
    srvy = Survey.new
    (1..4).each {|x| srvy.agree(x, 3)}
    srvy.edit(1, 5)
    assert srvy.answers[1] == 5
  end
  it "can be submitted when all statements have an answer" do
    srvy = Survey.new
    (1..4).each {|x| srvy.agree(x, 3)}
    srvy.submit
    assert srvy.finished?
  end
  it "will give the max, min, and avg of the answers when submitted" do
    srvy = Survey.new
    (1..4).each {|x| srvy.agree(x, 3)}
    srvy.submit
    assert srvy.avg == 3
    assert srvy.max == 3
    assert srvy.min == 3
  end
end
