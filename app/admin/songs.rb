ActiveAdmin.register Song do
    menu parent: "음악 관리"
     scope :all
     index do
    selectable_column
    id_column
    column :image do |obj|
      image_tag obj.image
    end
    column :title
    column :singer
    column :album
    column :created_at
    column :updated_at
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
