# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

item1 = Item.create(name: "red apples", price: 1.50)
item2 = Item.create(name: "cara cara oranges", price: 2.50, order_id: orders.first)
item3 = Item.create(name: "russet potatoes", price: 5.99)
item4 = Item.create(name: "dish soap", price: 3.99, order_id: orders.first)
item5 = Item.create(name: "toothpaste", price: 8.99, order_id: orders.first)
item6 = Item.create(name: "tortilla chips", price: 3.99, order_id: orders.first)
item7 = Item.create(name: "angel hair pasta", price: 4.50, order_id: orders.first)
item8 = Item.create(name: "chocolate ice cream", price: 8.50, order_id: orders.first)
item9 = Item.create(name: "mushrooms", price: 2.50)
item10 = Item.create(name: "bell peppers", price: 5.99, order_id: orders.first)

order1 = Order.create(user_id: users.first)
