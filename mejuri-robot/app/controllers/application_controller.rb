class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def index
    @data = {
      order_average_price: BuyOrder.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).average(:price).to_i,
      revenue: BuyOrder.sum(:price).to_i,
      total_cars_sold: Car.sold.count,
      cars_sold: Car.sold.order(updated_at: :desc).first(10),
      cars_builded: Car.where(ready_to_store: true).order(updated_at: :desc).first(10)
    }
  end
end
