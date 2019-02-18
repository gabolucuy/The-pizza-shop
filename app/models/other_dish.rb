class OtherDish < ApplicationRecord
  validates_presence_of :name
  has_one :order
end
