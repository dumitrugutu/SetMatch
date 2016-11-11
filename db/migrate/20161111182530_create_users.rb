class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :email, null: false
      t.string  :fullname, null: false
      t.string  :screen_name, null: false
      t.string  :password_digest, null: false
      t.text    :bio
      t.integer :rating
      t.integer :zipcode
      t.integer :age
      t.string  :gender
      t.integer :handed

      t.timestamps
    end
  end
end
