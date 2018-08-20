module PostsHelper
  def render_with_hashtags(content)
    content.scan(/@\w+/).map do |c|
      if User.find_by(name: c.delete('@')).nil?
        return content
      end
    end

    content.gsub(/@\w+/){|word| link_to word, "/timelines/tag/#{word.delete('@')}", class: "chip"}.html_safe
  end
end
