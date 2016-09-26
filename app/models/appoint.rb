class Appoint< ApplicationRecord
  belongs_to :room,class_name: 'Room',:foreign_key => "number"
  belongs_to :user,class_name: 'User',:foreign_key => "email"

  validates :user_id, :presence => true
  validates :room_id, :presence => true
  validates :start_time, :presence => true

end
