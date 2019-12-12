class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["WEBSITE_USERNAME"], password: ENV["WEBSITE_PASSWORD"]

  def show
    @products = Product.sum(:quantity)
    @categories = Category.count
  end
end
