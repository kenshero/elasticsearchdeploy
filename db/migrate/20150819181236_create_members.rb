class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :firstname
      t.string :lastname
      t.text :address
      t.string :phone
      t.integer :age

      t.timestamps null: false
    end
  end
end
