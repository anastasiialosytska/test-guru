class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  enum rule: {
    category: 0,
    level: 1,
    first_try: 2
  }
end

