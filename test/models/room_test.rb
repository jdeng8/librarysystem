require 'test_helper'

class RoomTest < ActiveSupport::TestCase


  test "Creating room"  do
    @room = Room.create(number: '1000', size: '4' , vacant: 'available', building:'Hunt')
    assert @room.save
  end

  test "Creating room without number" do
    @room = Room.create(number: '', size: '4' , vacant: 'available', building:'Hunt')
    assert_not @room.save
  end

  test "Creating room without size" do
    @room = Room.create(number: '1000', size: '' , vacant: 'available', building:'Hunt')
    assert_not @room.save
  end

  test "Creating room without status" do
    @room = Room.create(number: '1000', size: '4' , vacant: '', building:'Hunt')
    assert_not @room.save
  end

  test "Creating room without building" do
    @room = Room.create(number: '1000', size: '4' , vacant: 'available', building:'')
    assert_not @room.save
  end

end