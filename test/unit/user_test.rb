require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "format of username" do
    user = User.new(:email => "abc@gmail.com", :password => "12345678", :username => "")
    assert !user.valid?
    
    user.username = '12345678901'
    assert !user.valid?

    user.username = '12 3456789'
    assert !user.valid?
        
    user.username = '1234567890'
    assert user.valid?    
  end
end
