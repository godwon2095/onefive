class Singer < ActiveRecord::Base
  has_many :songs

  def self.generate_singers
    (460475..46900).each do |i|
      # begin
        result = Wombat.crawl do
          base_url "https://music.naver.com/"
          path "/artist/track.nhn?artistId=" + "#{i}" + "&sorting=popular"
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
      #   puts "stop #{i}"
      #   next
      # end
    end

  end

  def self.search(query)
      self.where("name LIKE ?","%#{query}%")
  end
end
