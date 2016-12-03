class BillSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :votes_for, :votes_against
end
