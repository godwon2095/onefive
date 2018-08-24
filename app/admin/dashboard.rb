ActiveAdmin.register_page "Dashboard" do
  menu priority: 1

  content title: proc { I18n.t("active_admin.dashboard") } do
  result = 0
  User.pluck('sign_in_count').map do |count|
     result += count

  end

   tabs do
     tab :site_info do

       table_for 2, class: 'index_table index container row' do
         column "총 유저 수" do
           User.all.size
         end
         column "총 게시글 수" do
           Post.all.size
         end
         column "총 노래 수" do
           Song.all.size
         end
         column "총 가수 수" do
           Singer.all.size
         end
       end
     end


     tab :visit_info do

       table_for 4, class: 'index_table index' do
         column "전체 방문 횟수" do
           User.all.size
         end
         column "총 로그인 횟수" do
           result
         end
       end
     end

   end


  end # content
end
