
set :environment, 'development'
env :PATH, ENV['PATH']
set :output, "/tmp/cron_log.log"

set :job_template, "source $HOME/.zshrc; $(which zsh) -l -c ':job'"

# NOTE: This configuration setup may varies in a different environment or machine where the code runs


# # BuilderRobot
# every 1.minute do
#   rake 'robot_builder:build_cars'
# end
#
# every 24.hours do
#   rake 'robot_builder:wipe_cars'
# end
#
# # GuardRobot
# every 30.minutes do
#   #check defects
#   rake 'robot_guard:check_defects'
# end
#
# every 30.minutes do
#   rake 'robot_guard:transfer_stock'
# end
#
# # BuyerRobot
# every 1.minute do
#   rake 'robot_buyer:buy_cars'
# end
