# frozen_string_literal: true
class CommentsController < ApplicationController
  skip_before_action :before_require_login, only: [
    :create
  ]

  def create
    @comment_info = put_commenter(comment_params)
    @product = Product.find params[:product_id]
    @comment = @product.comments.create @comment_info
    redirect_to product_path @product
  end

  private

  def comment_params
    params.permit :product_id
    params.require(:comment).permit :body
  end

  def put_commenter(params)
    params[:commenter] = crrent_user.username
    params if params.key? :commenter
  end

end
