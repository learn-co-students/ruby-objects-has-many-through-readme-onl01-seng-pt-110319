class Waiter
  attr_accessor :name, :yrs_exp
  
    @@all = []
  
  def initialize(name, yrs_exp)
    @name = name
    @yrs_exp = yrs_exp
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select{|m|m.waiter == self}
  end
  
  def best_tipper
    best_tip = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tip.customer
  end
  
end