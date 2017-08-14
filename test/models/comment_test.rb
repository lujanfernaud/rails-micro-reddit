require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new(post_id: 1, body: "This is a test comment!")
  end

  test "should be not valid is the body is not present" do
    @comment.body = nil
    assert_not @comment.valid?
  end
end
