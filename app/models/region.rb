class Region < ApplicationRecord
    belongs_to :campaign
    has_many :settlements, dependent: :destroy

    validates :name, presence: true
end