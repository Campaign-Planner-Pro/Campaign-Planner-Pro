class Region < ApplicationRecord
    validates :name, presence: true

    belongs_to :campaign
    has_many :settlements, dependent: :destroy
    has_many :interest_points, as: :interestable, dependent: :destroy
    has_many :settlement_interest_points, through: :settlements, source: :interest_points
    
    def all_interest_points
      InterestPoint.where(id: interest_points.ids + settlement_interest_points.ids)
    end
end