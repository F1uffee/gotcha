class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :proposal
  validates :vote, uniqueness:{scope: :proposal_id}
end
