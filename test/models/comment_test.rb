require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "comment new to product one" do

    @comment = { body: "hello", commenter: "Test" }

    @product = Product.first
    assert_not_nil @product
    p @product
    assert @product.comments.create @comment

    p 'comment new to product one [passed]'
  end
end
