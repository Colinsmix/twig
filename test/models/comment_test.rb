require 'test_helper'
class CommentTest < ActiveSupport::TestCase
  test 'comment cannot be blank' do
    comment = Comment.new
    assert_not comment.save
  end
end
