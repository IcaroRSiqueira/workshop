class Challenge < ApplicationRecord
  has_many :solutions
  has_many :challenge_comments
end
