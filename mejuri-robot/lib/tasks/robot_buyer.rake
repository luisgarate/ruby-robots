namespace :robot_buyer do
  desc 'buy cars'
  task buy_cars: :environment do
    BuyerRobot.buy_cars
  end
end
