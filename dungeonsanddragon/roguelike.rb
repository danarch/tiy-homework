module HasHitPoints
  def alive?
    @hit_points > 0
  end

  def dead?
    !alive?
  end
end

module Zombifiable
  def reanimate
    if dead?
      @hit_points = Float::INFINITY
    end
  end
  def headshot
    puts "Boom!"
    @hit_points = 0
  end
end


class Adventurer
  attr_reader :hit_points, :max_damage, :level
  attr_writer :hit_points

  include HasHitPoints

  def initialize (level=1)
    @level = level
    @max_damage = @max_damage || 4
    @hit_points_per_level ||= 10
    @hit_points = @level * @hit_points_per_level
  end

  def damage
    rand(1..@max_damage)
  end

  def attack(other)
    other.hit_points -= self.damage
  end
end

class Villager < Adventurer
  include Zombifiable
end

class Warrior < Adventurer
  def initialize (weapon, level = 1)
    @weapon = weapon
    @max_damage = 8
    @hit_points_per_level = 12
    super(level)
  end

  def savage_attak(other)
    puts "Attacking with a(n) #{@weapon}"
    num_attaks = (@level/3) + 1
    num.attacks.times { attack(other) }
    other.attack(self) unless other.dead?
  end
end

class Wizard < Adventurer
  attr_accessor :potions
  def initialize(level = 1)
    @hit_points_per_level = 8
    @mana = 10
    @potions = 5
    super
  end

  def drink_potion
    if @potions > 0
      @mana += 10
      @potions -= 1
    else
      puts "You are out of potions!"
    end
  end


  def magic_missle(other)
    if @mana < 5
      puts "Not enough mana"
      return
    else
      @mana -= 5
    end
    accuracy = ((@level + 1).fdiv(@level)) * 100
    hit = rand(1..100) < accuracy
    if hit
      puts "I attack the darkness"
      other.hit_points -= rand(6..100)
    else
      puts "You miss the darkness"
      other.hit_points
    end
  end
end

class Monster
  attr_reader :level
  attr_accessor :hit_points

  include HasHitPoints

  def initialize(level)
    @level = level
    @hit_points = 0
    level.times { @hit_points += rand(1..8) }
  end

  def attack(other)
    roll = rand(1..6)
    damage = roll

    while roll == 6
      roll = rand(1..6)
      damage += roll
    end
    other.hit_points -= damage
  end
end
