class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :card_holder_name
      t.string :net_payment
      t.string :order_number
      t.string :merchant_order_id

      t.timestamps
    end
  end
end
