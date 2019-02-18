class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :state
      t.references :pizza, foreign_key: true
      t.references :other_dish, foreign_key: true

      t.timestamps
    end
  end
end
