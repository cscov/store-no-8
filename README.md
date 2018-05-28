# README

## Project Description
This project is a fictional backend and partial frontend for an online grocery service. In future, I would like to finish the frontend views and ensure that a user could remove items from an order that has not yet been completed.

## Installation Instructions
### Version
This repo uses Ruby 2.3.1 and Rails 5.1.6. Two libraries were used. 1) RSpec, for testing, which Rails uses by default. 2) money-rails, which is a rails version of the Ruby money gem. It makes it easier to store currency values, and I felt that items and orders should have a price associated with them.

### Mac users
If you have a Mac, Ruby is already installed on your machine, but if you have not already installed the Rails gem, you will need to install it. If you do not also have the bundler gem, which allows you to install all gems for a project at once, you will also need to install that. Here's how to do that:
* From your terminal, run `gem install rails`
* Once that completes, run `gem install bundler`

### Windows users
Follow the instructions on [RubyInstaller.org](https://rubyinstaller.org/)

## Set up the project
You can either download the zipped project from the download link above, or clone the repo onto your own machine. If you are cloning, navigate to the directory where you would like the repo to live by using your terminal, and then copy the following command into your terminal: `git clone https://github.com/cscov/store-no-8.git`

### Installing gems
Once the project has been downloaded, run the following command in your terminal: `bundle install`

### Database creation and initialization
Once the project has downloaded to your machine and the gems have installed, run the following command in your terminal to set up the database and seed it:
`rails db:setup`

### Server
Once the database has been created, you need to set up your local server to interact with the project in your browser.
1. First, open a new tab in your terminal
2. Run the following command: `rails s`
3. In your browser, copy the following URL into the browser bar: `localhost:3000/`
Once there, you should be able to see the login screen and be able to click around as expected.

## How to test
1. Open a new tab in your terminal
2. To execute all tests at once, run the following command: `bundle exec rspec`


## Project Details

### Tables
#### users
| Column Name        | Data Type           | Details  |
| ------------- |:-------------:| :-----:|
| `id`      | integer | primary key, not null |
| `first_name`      | string | not null |
| `password_digest`      | string | not null |
| `session_token`      | string | not null |
| `email_address`      | string | not null, unique, indexed |

* Index on  `id` because primary keys are always indexed and on `email_address` for fast lookup of a common search term, and because it is also required to be unique.

* Additions: `password_digest` and `session_token` were added in order to facilitate backend user authentication. I wanted to do authentication because in the scenario of users and orders, users should only be able to see their own orders. For that to happen, they must be authenticated.

#### orders
| Column Name        | Data Type           | Details  |
| ------------- |:-------------:| :-----:|
| `id`      | integer | primary key, not null |
| `user_id`      | integer | foreign key, not null, indexed |
| `order_status`      | string |  |

* Index on `id`. Index on `user_id` because it is convention to create an index on foreign keys, and because this way, a given user's orders can be pulled up more quickly.

* Additions: `order_status` was added to indicate whether an order was able to be updated or cancelled. The options for this attribute are "processing" and "completed". "Processing" indicates the order can be edited or cancelled, while "completed" indicates that it is too late to make any changes.
Items will be covered under associations.

#### items
| Column Name        | Data Type           | Details  |
| ------------- |:-------------:| :-----:|
| `id`      | integer | primary key, not null |
| `name`      | string | not null |
| `price`      | decimal | precision: 8, scale: 2 |
| `price_cents`      | integer | not null, default: 0, Ruby Money object |
| `price_currency`      | string | not null, default: "USD" |

* Index on `id`.

* Additions: `price` was added because in a real world scenario, every item in an order would have a price. `price_cents` and `price_currency` are part of the money-rails library and help with currency conversion.

#### order_items
| Column Name        | Data Type           | Details  |
| ------------- |:-------------:| :-----:|
| `id`      | integer | primary key, not null |
| `order_id`      | integer | foreign key, not null, indexed |
| `item_id`      | integer | foreign key, not null, indexed |

* Indexes on `id`, `order_id`, `item_id`

* This joins table was added to create a many-to-many association between orders and items.

### Models
#### users
* Associations: A `user` has many `orders` and has many `items` through `orders`

* Other Validations: The user's password must be at least 6 characters

#### orders
* Associations: An `order` has many `order-items` and has many `items` through `order-items`. An `order` also belongs to a `user`.

#### items
* Associations: An `item` has many `order_items` and has many `orders` through `order_items`

#### order_items
* Associations: An `order_items` belongs to an `order` and belongs to an `item`

### Controllers and Routes

#### users
* `GET users/new` renders the sign up view
* `POST users` adds a new user to the database and redirects to the user's orders page
* Permitted params: `first_name`, `email_address`, `password`

#### session
* `GET session/new` renders the log in view
* `POST session` logs in the user and redirects to the user's orders page
* `DELETE session` logs the user out and redirects to the login view

#### orders
* `GET users/:user_id/orders` displays a list of all orders for the current user
* `POST users/:user_id/orders` adds a new order to the user's list of orders
* `GET users/:user_id/orders/:id` Displays a specific order for the current user
* `GET users/:user_id/orders/:id/edit` Allows the current user to update a specific order if it has not yet been completed
* `DELETE users/:user_id/orders/:id` Deletes the current order if it does not have an order status of "completed"

#### items
* `GET items` Displays a list of all available items
* `GET items/:id` Displays a specific item

#### order_items
* `POST order_items` Adds an item to an order
* `DELETE order_items.id` Removes an item from an order

#### root
* `GET /` Displays a home screen with links to items and current user's orders  

### Views
Because this is a backend project, I decided to keep the route content rendered in html and embedded ruby templates rather than using JSON and a framework such as React to render the views.

#### global navigation
* When the user is not logged in, a 'log in' button and 'sign up' button appear at the top of the screen.
* When the user is logged in, a 'welcome, {user.first_name}' message appears at the top of the screen with a 'log out' button.
* The 'home' screen displays a link to the current user's orders and the item index. If no one is logged in, the order index link will redirect to the login view.
* A link to 'home' is always present

#### users
* New: Displays the sign up page

#### session
* New: Displays the login page

#### orders
* Index: Displays the current user's orders. Order id links go to the 'order show' view
* Show: Displays a specific order (items, item prices, order total, order status) for the current user. If the order status is "processing", there will be an 'edit order' button and a 'cancel order' button present.

* Edit: Displays a particular order for the current user with the ability to add and remove items from the order, as well as cancel the order.
  * An item will have an 'add to order' button next to it.
  * Once it has been added to the order, it will appear in the order list with a 'remove from order' button next to it.


#### items
* Index: Displays a list of all items along with their prices.
* Show: Displays a page for a specific item. The page includes the item name and item price, as well as lorem ipsum nutrition facts.
