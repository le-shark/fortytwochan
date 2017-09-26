class RemovePicturesFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :pictures
  end
end
