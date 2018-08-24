class Song < ActiveRecord::Base
  belongs_to :singer

  def self.generate_songs
    (112579..112700).each do |i|
      # begin
        result = Wombat.crawl do
          base_url "https://music.naver.com/"
          path "/artist/track.nhn?artistId=" + "#{i}" + "&sorting=popular" #아티스트별
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
                  puts i
               end
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
    self.where("title LIKE ?","%#{query}%")
  end

  def self.find_songs(singer)
    self.where(singer_id: singer.ids)
  end
end
