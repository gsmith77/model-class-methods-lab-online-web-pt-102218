class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    self.all
  end

  def self.longest
   #binding.pry
    self.joins(:boats).limit(1).group("boats.length")
  end
end
