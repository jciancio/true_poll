class Vote < ApplicationRecord
  belongs_to :bill

  enum position: [:against, :for]
end
