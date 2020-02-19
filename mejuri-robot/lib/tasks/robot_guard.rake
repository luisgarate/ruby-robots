namespace :robot_guard do
  desc 'check car defects'
  task check_defects: :environment do
    GuardRobot.check_defects
  end

  desc 'move stock to the store'
  task transfer_stock: :environment do
    GuardRobot.transfer_stock
  end
end
