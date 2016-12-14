class Appoint< ApplicationRecord
  attr_accessor :get_current

  belongs_to :room,class_name: 'Room',:foreign_key => "room_id"
  belongs_to :user,class_name: 'User',:foreign_key => "user_id"

  validates :user_id, :presence => true
  validates :room_id, :presence => true
  validates :start_time, presence: true
  validates :length, presence: true, numericality: { greater_than: 0 }
  validate :start_date_cannot_be_in_the_past
  validate :start_date_cannot_be_out_for_week
  validate :overlaps
  validate :overlaps_user #, :on => :create, :if=> :user_admin?

  before_validation :calculate_end_time
  #before_create :overlaps_user

  scope :end_during, ->(new_start_time, new_end_time) do
    if (!new_start_time.nil?) && (!new_end_time.nil?)
      where('end_time > ? AND end_time < ?', new_start_time, new_end_time)
    else
      return nil
    end
  end

  scope :start_during, ->(new_start_time, new_end_time) do
    if (!new_start_time.nil?) && (!new_end_time.nil?)
      where('start_time > ? AND start_time < ?', new_start_time, new_end_time)
    else
      return nil
    end
  end

  scope :happening_during, ->(new_start_time, new_end_time) do
    if (!new_start_time.nil?) && (!new_end_time.nil?)
      where('start_time > ? AND end_time < ?', new_start_time, new_end_time)
    else
      return nil
    end
  end

  scope :enveloping, ->(new_start_time, new_end_time) do
    if (!new_start_time.nil?) && (!new_end_time.nil?)
      where('start_time < ? AND end_time > ?', new_start_time, new_end_time)
    else
      return nil
    end
  end

  scope :identical, ->(new_start_time, new_end_time) do
    if (!new_start_time.nil?) && (!new_end_time.nil?)
      where('start_time = ? AND end_time = ?', new_start_time, new_end_time)
    else
      return nil
    end
  end
end

def overlaps
  overlapping_appoints = [
      room.appoints.end_during(start_time, end_time),
      room.appoints.start_during(start_time, end_time),
      room.appoints.happening_during(start_time, end_time),
      room.appoints.enveloping(start_time, end_time),
      room.appoints.identical(start_time, end_time)
  ].flatten

  overlapping_appoints.delete self
  if overlapping_appoints.any?
    errors.add(:base, 'Slot has already been booked')
  end
end

def overlaps_user
overlapping_users = [
    user.appoints.end_during(start_time, end_time),
    user.appoints.start_during(start_time, end_time),
    user.appoints.happening_during(start_time, end_time),
    user.appoints.enveloping(start_time, end_time),
    user.appoints.identical(start_time, end_time)
].flatten

overlapping_users.delete self
if overlapping_users.any?
  errors.add(:base, 'user has already been booked')
end

end

def user_admin?
  self.get_current=="Member"
end
def set_current(cs)
  self.get_current=cs
end
def start_date_cannot_be_in_the_past
  if  start_time < DateTime.current
    errors.add(:start_time, 'must be booked from present time')
  end
end

def start_date_cannot_be_out_for_week
  if  start_time > DateTime.current + 7.day
    errors.add(:start_time, 'must be in 7 days')
  end
end
def calculate_end_time
  start_time = validate_start_time
  length = validate_length
  if start_time && length
    self.end_time = start_time + (length.hours - 60)
  end
end


def as_json(options = {})
  {
      :id => self.id,
      :start => self.start_time,
      :end => self.end_time + 60,
      :recurring => false,
      :allDay => false
  }
end

private

def validate_start_time
  if !self.start_time.nil?
    start_time = self.start_time
  else
    return nil
  end
end

def validate_length
  if !self.length.nil?
    length = self.length.to_i
  else
    return nil
  end
end


