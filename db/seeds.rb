# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

user1 = User.create(first_name: "Carolyn", email_address: "cscov@gmail.com", password: "123456")

order1 = Order.create(user_id: user1.id)

item1 = Item.create(name: "red apples", price: 1.50)
item2 = Item.create(name: "cara cara oranges", price: 2.50, order_id: order1.id)
item3 = Item.create(name: "russet potatoes", price: 5.99)
item4 = Item.create(name: "dish soap", price: 3.99, order_id: order1.id)
item5 = Item.create(name: "toothpaste", price: 8.99, order_id: order1.id)
item6 = Item.create(name: "tortilla chips", price: 3.99, order_id: order1.id)
item7 = Item.create(name: "angel hair pasta", price: 4.50, order_id: order1.id)
item8 = Item.create(name: "chocolate ice cream", price: 8.50, order_id: order1.id)
item9 = Item.create(name: "mushrooms", price: 2.50)
item10 = Item.create(name: "bell peppers", price: 5.99, order_id: order1.id)
