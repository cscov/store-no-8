# README

## Installation Instructions
### Version
This repo uses Ruby 2.3.1 and Rails 5.1.6. The only external library used is RSpec for testing, which Rails uses by default.

### Mac users
If you have a Mac, Ruby is already installed on your machine, but if you have not already installed the Rails gem, you will need to install it. If you do not also have the bundler gem, which allows you to install all gems for a project at once, you will also need to install that. Here's how to do that:
* From your terminal, run `gem install rails`
* Once that completes, run `gem install bundler`

### Windows users

## Set up the project
You can either download the zipped project from the download link above, or clone the repo onto your own machine. If you are cloning, navigate to the directory where you would like the repo to live by using your terminal, and then copy the following command into your terminal: `git clone https://github.com/cscov/store-no-8.git`

### Installing gems
Once the project has been downloaded, run the following command in your terminal

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
| `email_address`      | string | not null, unique |

* Index on email_address for fast lookup of a common search term, and because it is also required to be unique.

* Additions: `password_digest` and `session_token` were added in order to facilitate backend user authentication. I wanted to do authentication because in the scenario of users and orders, users should only be able to see their own orders. For that to happen, they must be authenticated.

### Models
