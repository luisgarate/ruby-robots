class Seat < ActiveRecord::Base
  belongs_to :car, counter_cache: true
end
