class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references  :user, foreign_key: true
      t.string  :title
      t.text    :body
      t.date    :date
      t.time    :start_time
      t.time    :end_time
      t.boolean :status

      t.timestamps
    end
  end
end
