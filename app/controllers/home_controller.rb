class HomeController < ApplicationController
  def index
    @top_rated_comics = Comic.paginate(:page => params[:page], 
                                       :per_page => 20,
                                       :order => "average_score DESC, rating_count DESC")
    @user_comic_lists = Rating.includes(:user).find(:all,
                                    :select => 'count(id) as count, user_id',
                                    :group => 'user_id',
                                    :order => "count DESC",
                                    :limit => 5)
    # .paginate(param[:page])
  end
end
