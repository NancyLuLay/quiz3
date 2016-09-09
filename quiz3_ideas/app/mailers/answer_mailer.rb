class AnswerMailer < ApplicationMailer
  def notify_idea_owner(like)
    idea_owner = like.idea.user
    if idea_owner
      mail(to: idea_owner.email,
           subject: "You got a new like to your idea")
    end
  end

  def notify_idea_owner(like)
    @like = like
    @idea = like.idea
    @idea_owner = like.idea.user
    if @idea_owner
      mail(to: @idea_owner.email,
           subject: "You got a new like to your idea")
    end
  end

end
