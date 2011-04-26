module ComicsHelper
  def suggest_comics_link
    link_to I18n.t('user_ratings.link.cannot_see_your_favourite_comic'), new_comic_request_path
  end
end
