ActiveAdmin.register_page "Dashboard" do
  menu priority: 1

  content title: proc { I18n.t("active_admin.dashboard") } do
   columns do
     column do
       h3 "유저 정보 요약"
       table_for 2, class: 'index_table index container row' do
         column "총 인플루언서 수" do
           User.all.size
         end
         column "총 브랜드 수" do
           Song.all.size
         end
       end
     end

     column do
       h3 "인플루언서 정보 요약"
       table_for 4, class: 'index_table index' do
         column "전체 등록 수" do
           User.all.size
         end
         column "활성화 수" do
           User.all.size
         end
         column "승인대기" do
           User.all.size
         end
         column "승인불가" do
           User.all.size
         end
       end
     end

   end
   
   
   
  columns do
    column do
      h3 "브랜드 정보 요약"
      table_for 4, class: 'index_table index' do
        column "전체 등록 수" do
          3
        end
        column "일반" do
          3
        end
        column "기업" do
          3
        end
        column "대행사" do
          3
        end
      end
    end
    column do
      h3 "브랜드 신청 정보 요약"
      table_for 4, class: 'index_table index' do
        column "전체 신청" do
          User.all.size
        end
        column "승인" do
          3
        end
        column "대기" do
          3
        end
        column "미승인" do
          3
        end
      end
    end
  end


  
  end # content
end