class PlayerCharacter < ApplicationRecord
  belongs_to :campaign
  validates :name, presence: true
  validates :background, presence: true
end
