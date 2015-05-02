class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :alive

  def initialize
    @age = 0
    @height = 0
    @alive = true
  end

  def age!
    @age += 1
  end
end

class FruitTree < Tree
  attr_reader :fruits

  def initialize
    @fruits = []
    super
  end

  def any_fruit?
    !@fruits.empty?
  end

  def age!
    super
    try_bearing_fruit! if @age >= 3
  end

  private
    def try_bearing_fruit!
      rand(0..10).times do
        @fruits << Fruit.new
      end
    end
end

class AppleTree < FruitTree
  attr_reader :apples

  def add_apples
  end

  def any_apples?
    any_fruit?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no oranges" unless self.any_apples?
  end

  def dead?
  end
end

class Fruit
  def initialize
    has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :color, :diameter

  def initialize(color, diameter)
  end
end

#THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data
  tree = Tree.new

  tree.age! until tree.any_apple?

  puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?
    basket = []

    # It places the apple in the basket
    while tree.any_apples?
      basket << tree.pick_an_apple!
    end

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    avg_diameter = # It's up to you to calculate the average diameter for this harvest.

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

# tree_data
