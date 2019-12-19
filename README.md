# Jungle

A mini e-commerce application built with Rails 4.2. This was built on an existing code base provided by [Lighthouse Labs](https://www.lighthouselabs.ca/), as a tool to learn Ruby and Rails during their web development bootcamp.

New features implemented include:
- automated testing with RSpec, Capybara, Poltergeist, and database-cleaner
- admin authentication, and ability to create new products and categories
- user sign-up and authentication
- order details recap
- sold-out badge
- notify user & prevent check-out for empty cart



## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* bcrypt
* Testing: 
  * Capybara
  * Poltergeist
  * database-cleaner

## Final Product
Home page
![Home page of Jungle e-commerce project](https://github.com/vkro/jungle-rails/blob/master/docs/Jungle-Homepage.png?raw=true)

Cart
![Jungle e-commerce project cart](https://github.com/vkro/jungle-rails/blob/master/docs/Jungle-Cart.png?raw=true)

Completed Order
![Jungle e-commerce project completed order page](https://github.com/vkro/jungle-rails/blob/master/docs/Jungle-Completed_Order.png?raw=true)

Admin - Categories page
![Jungle e-commerce project - Admin categories page](https://github.com/vkro/jungle-rails/blob/master/docs/Jungle-Admin-Categories.png?raw=true)