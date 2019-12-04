class Customer
  attr_reader :name, :age
  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.find_all { |meal| meal.customer == self  }
  end

  def waiters
    waiter_array = []
    Meal.all.each { |meal|
      meal.customer == self ? waiter_array << meal.waiter : nil
    }
    waiter_array
  end
end
