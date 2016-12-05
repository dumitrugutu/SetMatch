class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :email, null: false, length: 100
      t.string  :fullname, null: false, length: 100
      t.string  :screen_name, null: false, length: 50
      t.string  :password_digest, null: false, length: 50
      t.text    :bio, null: false, length: 255
      t.integer :rating, null: false
      t.integer :zipcode, null: false
      t.integer :age, null: false
      t.string  :gender, null: false
      t.integer :handed, null: false

      t.timestamps
    end
  end
end
