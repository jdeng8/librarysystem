class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :appoints
  has_many :rooms, :through => :appoints

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
