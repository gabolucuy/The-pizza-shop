#Cheeses
Cheese.create(name: "Cheddar")
Cheese.create(name: "Bergenost")
Cheese.create(name: "Colby")

#Sauces
Sauce.create(name: "BBQ")
Sauce.create(name: "Hot")
Sauce.create(name: "Honey Garlic")
Sauce.create(name: "Honey Mustard")

#Crust
Crust.create(name: "Thin")
Crust.create(name: "Thick")
Crust.create(name: "Filled with cheese")

#Sizes
Size.create(name: "Personal", slices: 2)
Size.create(name: "Small", slices: 4)
Size.create(name: "Medium", slices: 6)
Size.create(name: "Large" , slices: 8)

#Crusts
Crust.create(name: "Thin")
Crust.create(name: "Thick")
Crust.create(name: "Filled with cheese")

#Ingredients
(1..10).each do
	Ingredient.create(name: Faker::Food.ingredient)
end

#Pizza types
PizzaType.create(name: "Hawaiian")
PizzaType.create(name: "Brazilian")
PizzaType.create(name: "Veggie")
PizzaType.create(name: "Simple")

#Other dishes
NonPizza.create(name: "Spaghetti")
NonPizza.create(name: "Lasagna")
NonPizza.create(name: "Salad")
