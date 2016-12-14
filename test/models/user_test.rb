require 'test_helper'

class UserTest < ActiveSupport::TestCase


  test "Creating user"  do
    @room = User.create(email: 'admin@ncsu.edu', name: 'admin' , password: '123456')
    assert @room.save
  end

  test "Creating user without name" do
    @room = User.create(email: 'admin@ncsu.edu', name: '' , password: '123456')
    assert_not @room.save
  end

  test "Creating user without Email" do
    @room = User.create(email: '', name: 'admin' , password: '123456')
    assert_not @room.save
  end

  test "Creating user with wrong Email" do
    @room = User.create(email: 'adminadmin', name: 'admin' , password: '123456')
    assert_not @room.save
  end

  test "Creating user without password" do
    @room = User.create(email: 'admin@ncsu.edu', name: 'admin' , password: '')
    assert_not @room.save
  end

end