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

  def next_state(delivery)
		if self.state == "Box it" && delivery then self.state = "Delivery" end
		if self.state == "Box it" && !delivery then self.state = "Dispatched" end
		if self.state == "Cut it" then self.state = "Box it" end
		if self.state == "Bake it" then self.state = "Cut it" end
		if self.state == "In preparation" then self.state = "Bake it" end
		self.save
  end

end
