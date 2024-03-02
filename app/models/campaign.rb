class Campaign < ApplicationRecord
    has_many :nonplayer_characters

    belongs_to :user
    validates_presence_of :name, :description
end