class IdeasController < ApplicationController

  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize!, only: [:edit, :update, :destroy]

  def new
    @idea = Idea.new
  end

  def create
    @idea        = Idea.new idea_params
    @idea.user = current_user
    @user = User.create(user_params)
    if @idea.save
      redirect_to idea_path(@idea), notice: "Idea created successfully"
    else
      render :new
    end
  end

  def show
    @members = @idea.joins
    @comment = Comment.new
  end

  def index
    @ideas = Idea.all
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

  private
  def find_idea
    @idea = Idea.find params[:id]
  end

  def user_params
    params.require(:user).permit(:avatar)
  end

  def idea_params
    params.require(:idea).permit([:title, :body, :user_id])
  end

  def authorize!
    redirect_to(root_path, alert: "access defined") unless can? :manage, @idea
  end

end
