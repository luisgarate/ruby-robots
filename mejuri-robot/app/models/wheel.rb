class Wheel < ActiveRecord::Base
  belongs_to :car, counter_cache: true
end
