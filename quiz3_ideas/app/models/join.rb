class Join < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :user_id, uniqueness: {scope: :idea_id,
                      message: "Joined already"}
end
