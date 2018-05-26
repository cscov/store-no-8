# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

user1 = User.create(first_name: "Carolyn", email_address: "cscov@gmail.com", password: "123456")

order1 = Order.create(user_id: user1.id, order_status: "completed")
order2 = Order.create(user_id: user1.id, order_status: "processing")

item1 = Item.create(name: "red apples", price: 1.50)
item2 = Item.create(name: "cara cara oranges", price: 2.50)
item3 = Item.create(name: "russet potatoes", price: 5.99)
item4 = Item.create(name: "dish soap", price: 3.99)
item5 = Item.create(name: "toothpaste", price: 8.99)
item6 = Item.create(name: "tortilla chips", price: 3.99)
item7 = Item.create(name: "angel hair pasta", price: 4.50)
item8 = Item.create(name: "chocolate ice cream", price: 8.50)
item9 = Item.create(name: "mushrooms", price: 2.50)
item10 = Item.create(name: "bell peppers", price: 5.99)

order_item1 = OrderItem.create(order_id: order2.id, item_id: item1.id)
order_item2 = OrderItem.create(order_id: order1.id, item_id: item2.id)
order_item3 = OrderItem.create(order_id: order2.id, item_id: item3.id)
order_item4 = OrderItem.create(order_id: order1.id, item_id: item4.id)
order_item5 = OrderItem.create(order_id: order1.id, item_id: item5.id)
order_item6 = OrderItem.create(order_id: order1.id, item_id: item6.id)
order_item7 = OrderItem.create(order_id: order1.id, item_id: item7.id)
order_item8 = OrderItem.create(order_id: order1.id, item_id: item8.id)
order_item9 = OrderItem.create(order_id: order2.id, item_id: item9.id)
order_item10 = OrderItem.create(order_id: order2.id, item_id: item10.id)
