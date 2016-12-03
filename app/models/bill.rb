class Bill < ApplicationRecord
  has_many :votes
  attr_accessor :votes_for, :votes_against

  def votes_for_count
    votes.where(position: 1).count
  end

  def votes_against_count
    votes.where(position: 0).count
  end

  def calculate_votes
    self.votes_for = votes_for_count
    self.votes_against = votes_against_count
  end

  def self.all_with_votes
    all.each do |b|
      b.votes_for = b.votes_for_count
      b.votes_against = b.votes_against_count
    end
  end
end
