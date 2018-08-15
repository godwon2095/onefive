module PostsHelper
  def render_with_hashtags(content)
    content.gsub(/@\w+/){|word| link_to word, "/timelines/tag/#{word.delete('@')}"}.html_safe
  end
end
