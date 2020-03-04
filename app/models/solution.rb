class Solution < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
  validates :challenge_id, uniqueness: { scope: [:user_id], message: 'Usúario já respondeu' }
end
