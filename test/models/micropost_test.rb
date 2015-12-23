require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:Example)
  	@micropost = @user.microposts.build(content:"new content")
  end

  test "valid" do 	
  	assert @micropost.valid?
  end

  test "presence" do 
  	@micropost.user_id = nil
  	assert_not @micropost.valid?
  end
end
