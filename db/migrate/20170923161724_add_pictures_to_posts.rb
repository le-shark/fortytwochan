class AddPicturesToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :pictures, :string
  end
end
