require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(user_id: 3, title: "This is a test post", body: "a" * 1000)
  end

  test "should be not valid if title is missing" do
    @post.title = ""
    assert_not @post.valid?
  end

  test "should be not valid if body is missing" do
    @post.body = ""
    assert_not @post.valid?
  end
end
