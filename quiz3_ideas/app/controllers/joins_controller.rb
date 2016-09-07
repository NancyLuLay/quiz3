class JoinsController < ApplicationController
  before_action :authenticate_user!

  def create
    idea = Idea.find params[:idea_id]
    join = Join.new user:current_user, idea:idea
    if !(can? :join, idea)
      redirect_to root_path, alert: "access denied"
    elsif join.save
      redirect_to idea_path(idea), notice: "Thanks for joining"
    else
      redirect_to idea_path(idea), alert: join.errors.full_messages.join(", ")
    end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    join = Join.find params[:id]
    if can? :destroy, join
      join.destroy
      redirect_to idea_path(idea), notice: "Not Joined Anymore!"
    else
      redirect_to root_path, alert: "access denied!"
    end
  end


end
