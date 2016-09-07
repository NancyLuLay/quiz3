class CommentsController < ApplicationController
  def create
    @comment = Comment.new params.require(:comment).permit(:body)
    @idea = Idea.find params[:idea_id]
    @comment.idea = @idea
    if @comment.save
    redirect_to(idea_path(@idea), notice: "Comment created")
    else
    render :new
    end
  end

  def destroy
  comment = Comment.find params[:id]
  comment.destroy
  redirect_to(idea_path(@idea), notice: "Comment deleted")
  end


end
