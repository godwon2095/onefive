ActiveAdmin.register Post do
  menu parent: "게시글 관리"

  scope :all

  index do
    selectable_column
    id_column
    column :image do |obj|
      image_tag obj.image.url, class: "thumbnail-size" if obj.image?
    end
    column :title
    column '글쓴이' do |post|
      post.user.name
    end
    column :view_count
    column '담은 수' do |post|
      post.likes.size
    end

    column '댓글 수' do |post|
      post.comments.size
    end
    column :created_at
  end

  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
