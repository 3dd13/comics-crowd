class ComicRatingsController < ApplicationController
  before_filter :requires_login
  before_filter :find_comic

  def new
    existing_rating = current_user.ratings.find_by_comic_id(@comic.id)
    if existing_rating
      redirect_to edit_comic_rating_path(@comic, existing_rating)
    else
      @rating = current_user.ratings.build(:comic_id => @comic.id)
    end
  end
  
  def create
    options = Hash.new
    options[:comic_id] = @comic.id
    @rating = current_user.ratings.build(options.merge(params[:rating]))
    if @rating.save
      redirect_to root_path, :notice => I18n.t("user_ratings.notice.rated_successfully")
    else
      render "new"
    end
  end
  
  def edit
    @rating = current_user.ratings.find_by_comic_id(@comic.id)    
  end
  
  def update
    @rating = current_user.ratings.find_by_comic_id(@comic.id)

    if @rating.update_attributes(params[:rating])
      redirect_to(root_path, :notice => 'Rating was successfully updated.')
    else
      render 'edit'
    end
  end
  
  private
  
  def find_comic
    @comic = Comic.find(params[:comic_id])    
    redirect_to root_path, :flash => {:error => "Invalid comic id."} unless @comic
  end
  
  def requires_login
    redirect_to new_session_path("user"), :notice => I18n.t("user_ratings.notice.login_before_rate") unless current_user
  end
end
