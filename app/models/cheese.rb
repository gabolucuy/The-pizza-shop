class Cheese < ApplicationRecord
  has_one :pizza
  validates_presence_of :name
end
