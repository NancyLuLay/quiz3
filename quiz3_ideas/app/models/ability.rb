class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

  can :manage, Idea do |idea|
    user == idea.user
  end

  can :destroy, Like do |like|
    user == like.user
  end

  can :like, Idea do |idea|
    user != idea.user
  end

  cannot :like, Idea do |idea|
    user == idea.user
  end

  can :destroy, Join do |join|
    user == join.user
  end

  can :join, Idea do |idea|
    user != idea.user
  end

  cannot :join, Idea do |idea|
    user == idea.user
  end

  end

end
