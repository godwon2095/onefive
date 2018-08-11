class Song < ActiveRecord::Base
  belongs_to :singer

  def self.generate_songs
    # (150..500000).each do |i|
      result = Wombat.crawl do

        base_url "https://music.naver.com/"
        path "/artist/track.nhn?artistId=" + "112579" + "&sorting=popular" #아티스트별
        music_titles({ css: ".track"  }, :list)
        music_images({ xpath: ".//td//a[1]//img/@src" }, :list)
        music_singers({ css: ".tb_artist"  }, :list)
        music_albums({ css: ".album"  }, :list)

          features css: '.nav-item-opensource'
          business css: '.nav-item-business'
      end

      if result.present?
        result["music_titles"].each_with_index do |r, index|
            if Singer.find_by(name: result["music_singers"]).present?
              if Song.find_or_create_by(title: r,
                                     singer_id: Singer.find_by(name: result["music_singers"][index]).id,
                                     image: result["music_images"][index],
                                     album: result["music_albums"][index]).nil?

                Song.find_or_create_by(title: r,
                                       singer_id: Singer.find_by(name: result["music_singers"][index]).id,
                                       image: result["music_images"][index],
                                       album: result["music_albums"][index])
             end
            end
        end
      end
    # end
  end

  def self.search(query)
      self.where("title LIKE ?","%#{query}%")
  end
end
