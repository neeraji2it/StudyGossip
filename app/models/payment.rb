class Payment < ActiveRecord::Base
  attr_accessible :card_holder_name, :merchant_order_id, :net_payment, :order_number
end
