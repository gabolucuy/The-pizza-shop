class CreatePizzaIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :pizza_ingredients do |t|
      t.references :pizza, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
