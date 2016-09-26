class Room < ApplicationRecord

  has_many :appoints
  has_many :users, :through => :appoints
  validates :number, :uniqueness => true
  validates :size, :presence => true
  validates :vacant, :presence => true
  validates :building, :presence => true


end
