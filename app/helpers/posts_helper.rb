module PostsHelper
  def render_with_hashtags(content)
    content.scan(/@\w+/).map do |c|
      if User.find_by(name: c.delete('@')).nil?
        return content
      end
    end

    content.gsub(/@\w+/){|word| link_to word, "/timelines/tag/#{word.delete('@')}", class: "chip"}.html_safe
  end


  
  # def hashtag(content)
  #   content_ary = content.split("@").split(" ")
  #
  #   content_ary.each do |content|
  #     if Tag.find_by_name(content)
  #       link_to(content, "/timelines/tag/#{word.delete('@')}", class: "chip").html_safe
  #     else
  #
  #     end
  #   end
  # end
end
