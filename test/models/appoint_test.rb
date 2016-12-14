require 'test_helper'

class AppointTest < ActiveSupport::TestCase


  test "Creating appoint"  do
    @appoint = Appoint.create(user_id:'1', room_id:'1', start_time:'14:50')
    assert @appoint.save
  end

  test "Creating appoint without user"  do
    @appoint = Appoint.create(user_id:'', room_id:'1', start_time:'14:50')
    assert @appoint.save
  end

  test "Creating appoint with non-existing user"  do
    @appoint = Appoint.create(user_id:'A', room_id:'1', start_time:'14:50')
    assert @appoint.save
  end

  test "Creating appoint without room"  do
    @appoint = Appoint.create(user_id:'1', room_id:'', start_time:'14:50')
    assert @appoint.save
  end

  test "Creating appoint with non-existing room"  do
    @appoint = Appoint.create(user_id:'1', room_id:'B', start_time:'14:50')
    assert @appoint.save
  end

  test "Creating appoint without start time"  do
    @appoint = Appoint.create(user_id:'1', room_id:'1', start_time:'')
    assert @appoint.save
  end

  test "Creating appoint with wrong time"  do
    @appoint = Appoint.create(user_id:'1', room_id:'1', start_time:'ABCD')
    assert @appoint.save
  end



end