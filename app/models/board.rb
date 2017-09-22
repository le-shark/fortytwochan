class Board < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:finders, :slugged]
  validates :name, presence: true, length: { maximum: 5 }
  validates :title, presence: true
end
