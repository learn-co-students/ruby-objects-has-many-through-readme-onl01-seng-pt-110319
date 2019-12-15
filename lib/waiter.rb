class Waiter
  attr_accessor :name, :yrs_experience 
   
   @@all = [] 
   
   def initialize(name, yrs_experience)
     @name = name 
     @yrs_experience = yrs_experience 
     @@all << self 
   end 
    
  def self.all 
    @@all 
  end 
end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end
  
def meals 
  Meal.all.select do |meal|
    meal.waiter == self 
  end 
end 

def best_tipper
  best_tipped_meal = meals.max do |meal_a, meal_b|
    meal_a.tip <=> meal_b.tip
  end
 
  best_tipped_meal.customer
end

terrance = Customer.new("Terrance", 27)
jason = Waiter.new("Jason", 4)
andrew = Waiter.new("Andrew", 7)
yomi = Waiter.new("Yomi", 10)

terrance.new_meal(jason, 50, 6)
terrance.new_meal(andrew, 60, 8)
terrance.new_meal(yomi, 30, 4)