class Sauce < ApplicationRecord
  validates_presence_of :name
  has_one :pizza
end
