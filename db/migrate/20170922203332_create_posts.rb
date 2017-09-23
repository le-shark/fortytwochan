class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :post_type
      t.string :ip
      t.integer :thread_id
      t.text :text

      t.timestamps
    end
  end
end
