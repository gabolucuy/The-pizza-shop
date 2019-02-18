class Order < ApplicationRecord
  belongs_to :pizza, optional: true
  belongs_to :other_dish,  optional: true
  validate :order_consistence_validation

  after_create do
	   self.update_attribute(:state,"In preparation")
	end

  def order_consistence_validation
    if pizza_id == nil && other_dish_id == nil
	     errors.add(:order, "A pizza or other product must exist")
    end
  end

end
