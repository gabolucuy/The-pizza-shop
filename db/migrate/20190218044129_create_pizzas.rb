class CreatePizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.references :cheese, foreign_key: true
      t.references :crust, foreign_key: true
      t.references :pizza_type, foreign_key: true
      t.references :sauce, foreign_key: true
      t.references :size, foreign_key: true

      t.timestamps
    end
  end
end
