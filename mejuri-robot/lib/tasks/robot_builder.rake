namespace :robot_builder do
  desc 'build cars'
  task build_cars: :environment do
    BuilderRobot.build_cars
  end

  desc 'wipe cars'
  task wipe_cars: :environment do
    BuilderRobot.wipe_cars
  end
end
