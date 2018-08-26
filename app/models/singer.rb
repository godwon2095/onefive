class Singer < ActiveRecord::Base
  has_many :songs

  def self.generate_singers
<<<<<<< HEAD
    # (all.count..(all.count + 300)).each do |i|
      # begin
        result = Wombat.crawl do
          base_url "https://music.naver.com/"
          path "/artist/track.nhn?artistId=" + "343255" + "&sorting=popular" #아티스트별
=======
    (143179..143250).each do |i|
      # begin
        result = Wombat.crawl do
          base_url "https://music.naver.com/"
          path "/artist/track.nhn?artistId=" + "#{i}" + "&sorting=popular"
>>>>>>> 22438a0530714d8bd168e9e1e97242f40ac0d666
            music_singers({ css: ".tb_artist"  }, :list)
              features css: '.nav-item-opensource'
              business css: '.nav-item-business'
        end

        if result.present?
          result["music_singers"].each_with_index do |s, index|
            if Singer.find_by(name: s).nil?
              Singer.find_or_create_by(name: s)
              puts "#{i} 크롤링 함 : #{s}"

            end
          end
        end
      # rescue
<<<<<<< HEAD
      #   next
      # end
    # end
=======
      #   puts "stop #{i}"
      #   next
      # end
    end
>>>>>>> 22438a0530714d8bd168e9e1e97242f40ac0d666

  end

  def self.search(query)
      self.where("name LIKE ?","%#{query}%")
  end
end
