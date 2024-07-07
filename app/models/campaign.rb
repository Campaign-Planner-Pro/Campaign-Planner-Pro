class Campaign < ApplicationRecord
    has_many :nonplayer_characters, dependent: :destroy
    has_many :player_characters, dependent: :destroy
    has_many :regions, dependent: :destroy

    belongs_to :user
    validates_presence_of :name, :description
end