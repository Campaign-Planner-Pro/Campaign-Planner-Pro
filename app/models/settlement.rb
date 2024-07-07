class Settlement < ApplicationRecord
    belongs_to :region
    has_many :interest_points, as: :interestable, dependent: :destroy
    validates_presence_of :name, :government,  :atmosphere
    validates :size, presence: true, inclusion: { in: ["Village", "Town", "City"],
    message: "%{value} is not a valid size" }
end