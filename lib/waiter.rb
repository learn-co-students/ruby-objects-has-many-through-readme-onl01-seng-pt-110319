class Waiter
  attr_reader :name, :experience
  @@all = []

  def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.find_all { |meal| meal.waiter == self  }
  end

  def best_tipper
    best_customer = nil
    highest_tip = meals.first.tip
    meals.each { |meal|
      if highest_tip < meal.tip
        highest_tip = meal.tip
        best_customer = meal.customer
      end
    }
    best_customer
  end
end
