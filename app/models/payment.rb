class Payment < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :card_holder_name, :email, :zipcode, :state, :street_address, :city, :country,
:purchased_at, :payment_amount, :net_payment, :order_number, :merchant_order_id, :status, :user_type

  validates :payment_amount, :presence => true
end
