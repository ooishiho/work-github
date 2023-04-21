class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { production_not_allowed:0, waiting_for_production:1, in_production:2, production_completed:3 }
end
