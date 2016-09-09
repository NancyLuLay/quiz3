class User < ApplicationRecord
  has_secure_password

  has_many :ideas, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  has_many :joins, dependent: :destroy
  has_many :joined_ideas, through: :joins, source: :idea

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    format: VALID_EMAIL_REGEX

# Avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

end
