class InterestPoint < ApplicationRecord
  belongs_to :interestable, polymorphic: true
end
