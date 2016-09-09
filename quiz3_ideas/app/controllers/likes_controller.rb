class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    idea = Idea.find params[:idea_id]
    like = Like.new user:current_user, idea:idea
    if !(can? :like, idea)
      redirect_to root_path, alert: "access denied"
    elsif like.save
      AnswerMailer.notify_idea_owner(like).deliver_later
      redirect_to idea_path(idea), notice: "Thanks for liking"
    else
      redirect_to idea_path(idea), alert: like.errors.full_messages.join(", ")
    end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    like = Like.find params[:id]
    if can? :destroy, like
      like.destroy
      redirect_to idea_path(idea), notice: "Like removed!"
    else
      redirect_to root_path, alert: "access denied!"
    end
  end

end
