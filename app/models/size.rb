class Size < ApplicationRecord
  validates_presence_of :name,:slices
  has_one :pizza
end
