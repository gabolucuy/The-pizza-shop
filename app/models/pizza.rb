class Pizza < ApplicationRecord
  belongs_to :cheese
  belongs_to :crust
  belongs_to :pizza_type
  belongs_to :sauce
  belongs_to :size
  validates_presence_of :cheese
  validates_presence_of :crust
  validates_presence_of :pizza_type
  validates_presence_of :sauce
  validates_presence_of :size
end
