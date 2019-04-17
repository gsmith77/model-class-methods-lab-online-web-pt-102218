class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    #boats = ["H 28", "Nacra 17", "Regulator 34SS", "Zodiac CZ7", "Boston Whaler"]
    self.limit(5)
  end
  
  def self.dinghy
    self.where("length < 20")
  end

  def self.ship
    self.where("length >= 20")
  end

  def self.last_three_alphabetically
    #boats = ["Zodiac CZ7", "Triton 21 TRX", "Sunfish"]
    self.limit(3).order(:name).reverse_order
  end

  def self.without_a_captain
    self.where(captain_id: nil)
  end

  def self.sailboats
    #boats = ["H 28", "Nacra 17", "49er", "Laser", "Harpoon 4.7", "Sunfish"]
    self.joins(:classifications).where(classifications:{name:"Sailboat"})
  end

  def self.with_three_classifications
    self.joins(:boat_classifications).group(:boat_id).having("COUNT(boat_id)= 3")
  end

end
