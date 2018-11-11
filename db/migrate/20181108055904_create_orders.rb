class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.float :total
      t.string :username
      t.string :address
      t.string :cardnum
      t.string :email
      t.string :status
      
      t.timestamps
    end
  end
end
