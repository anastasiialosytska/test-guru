class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy 
  has_many :users, through: :user_badges

  enum rule: {
    category: 0,
    level: 1,
    first_try: 2
  }
end

