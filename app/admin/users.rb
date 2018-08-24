ActiveAdmin.register User do
  menu parent: "사용자 관리"

    scope :all

    index do
    selectable_column
    id_column
    column :thumbnail do |obj|
      image_tag obj.thumbnail.url, class: "thumbnail-size" if obj.thumbnail?
    end
    column :email
    column :identity
    column :name
    column :sign_in_count
    column '게시물 수' do |user|
      user.posts.size
    end
    column '팔로잉'do |user|
      user.followings.size
    end
    column '팔로워'do |user|
      user.followers.size
    end

    actions
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

end
