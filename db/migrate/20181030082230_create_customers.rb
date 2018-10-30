# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, comment: 'customer name'
      t.string :phone, comment: 'phone number'
      t.string :email, null: false, comment: 'email'
      t.string :image_path, comment: 'image of customer'

      t.timestamps
    end

    add_index :customers, :email, name: 'customers_idx01'
  end
end
