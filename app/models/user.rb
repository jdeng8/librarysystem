class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :appoints
  has_many :rooms, :through => :appoints

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :set_admin

  private
  def set_admin
    if  User.count == 1
      User.first.update_attribute(:privilege, 'SAdmin')
    else
      return true
    end
  end
end
