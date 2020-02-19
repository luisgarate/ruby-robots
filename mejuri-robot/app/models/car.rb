class Car < ActiveRecord::Base
  has_many :wheels
  has_many :seats

  has_one :chassis
  has_one :computer
  has_one :engine
  has_one :laser

  scope :by_model, -> (model) { where(model: model) }
  scope :not_sold, -> { where(sold: false) }
  scope :sold, -> { where(sold: true) }
  scope :ready_in_warehouse, -> { where(ready_to_store: true, store: false) }
  scope :in_store, -> { where(store: true) }

  def is_completed?
    complete
  end

  def which_line?
    is_completed? ? "The car is completed" : line
  end

end
