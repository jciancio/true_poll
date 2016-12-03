class Bill < ApplicationRecord
  has_many :votes

  def votes_for
    votes.where(position: 1)
  end

  def votes_against
    votes.where(position: 0)
  end
end
