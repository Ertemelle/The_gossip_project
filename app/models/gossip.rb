class Gossip < ApplicationRecord
	belongs_to :user, optional: true
	has_many :comments
	has_and_belongs_to_many :tags
	has_many :likes, as: :likeable
end
