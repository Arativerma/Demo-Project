class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :currency
      t.string :payment_method_types
      t.string :card_number
      t.integer :expiration_month
      t.integer :expiration_year
      t.string :cardholder_name
      t.string :billing_address
      t.string :payment_status
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
