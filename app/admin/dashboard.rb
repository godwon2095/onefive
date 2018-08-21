ActiveAdmin.register_page "Dashboard" do
menu priority: 1

  content title: proc { I18n.t("active_admin.dashboard") } do
   columns do
     column do
       h3 "정보"
       table_for 2, class: 'index_table index' do
         column "총 게시물 수" do
           Post.all.size
         end
         column "총 유저 수" do
           User.all.size
         end
       end
     end
  #   @influencers = Influencer.all
  #   column do
  #     h3 "인플루언서 정보 요약"
  #     table_for 4, class: 'index_table index' do
  #       column "전체 등록 수" do
  #         @influencers.size
  #       end
  #       column "활성화 수" do
  #         @influencers.size
  #       end
  #       column "승인대기" do
  #         @influencers.size
  #       end
  #       column "승인불가" do
  #         @influencers.size
  #       end
  #     end
  #   end

  # end
  # columns do
  #   column do
  #     @brands = Brand.all
  #     h3 "브랜드 정보 요약"
  #     table_for 4, class: 'index_table index' do
  #       column "전체 등록 수" do
  #         @brands.size
  #       end
  #       column "일반" do
  #         @brands.size
  #       end
  #       column "기업" do
  #         @brands.size
  #       end
  #       column "대행사" do
  #         @brands.size
  #       end
  #     end
  #   end
  #   column do
  #     h3 "브랜드 신청 정보 요약"
  #     table_for 4, class: 'index_table index' do
  #       column "전체 신청" do
  #         User.all.size
  #       end
  #       column "승인" do
  #         Brand.all.size
  #       end
  #       column "대기" do
  #         Brand.all.size
  #       end
  #       column "미승인" do
  #         Brand.all.size
  #       end
  #     end
  #   end

  # content title: proc{ I18n.t("active_admin.dashboard") } do
  #   div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    end
  end # content
end
