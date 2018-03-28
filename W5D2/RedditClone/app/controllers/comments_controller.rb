class CommentsController < ApplicationController
  before_action :require_log_in!

  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    if @comment.save
      redirect_to sub_url(@comment.post.sub)
      # will send to main sub 
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
    #post_id
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
