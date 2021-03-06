module ArticlesHelper
  require "mini_magick"

    def resized_image(image)
      image = MiniMagick::Image.open(image)
      image.resize "400x400"
      image.rotate "-90"
    end
  
    def display_index_article_links(article)
      capture do
        concat link_to('Preberi več', article, class: 'stretched-link')
      end
    end

    def display_show_article_links(article)
    capture do
      if current_user == article.user
        concat link_to 'Izbriši', article, method: :delete, data: { confirm: 'Are you sure?' }
        concat ' | '
        concat link_to 'Uredi', edit_article_path(article)
        concat ' | '
      end
      concat link_to 'Back', articles_path
    end
  end
end
