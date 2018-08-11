class AddPostimagesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_images, :json
  end
end
