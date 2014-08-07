require "colorize"

class Pen
  attr_reader :color
  def initialize color
    @color = color
  end

  def write text
    puts text.send(color)
  end
end

def ClickPen < Pen
  attr_writer :color
end
