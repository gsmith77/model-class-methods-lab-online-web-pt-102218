class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    #it "returns all captains of catamarans" do
    #captains = ["Captain Kidd", "Samuel Axe"]
    self.select(:name).where("boats.classifications.name = 'Catamarans'")
  end
end
