ActiveAdmin.register Post do
  menu parent: "게시글 관리"
  permit_params :image, :title, :password, :password_confirmation, :identity, :phonenumber, :information, :thumbnail

  scope :all

  index do
  selectable_column
  id_column
  column :image do |obj|
    image_tag obj.image.url, class: "thumbnail-size" if obj.image?
  end
  column :title
  column :user
  column :created_at
  column :updated_at

  actions
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
# end
