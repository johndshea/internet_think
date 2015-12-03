class CommentsController < ApplicationController
  before_filter :require_login, except: [:create]
  def create
    @comment = Comment.new(comment_params)
    @comment.curiosity_id = params[:curiosity_id]
    @comment.save

    redirect_to curiosity_path(@comment.curiosity)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
