class RatingsController < ApplicationController
  # GET /ratings
  # GET /ratings.xml
  def index
    @ratings = current_user.ratings.order("rating DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ratings }
    end
  end

  # GET /ratings/1
  # GET /ratings/1.xml
  def show
    @rating = current_user.ratings.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/new
  # GET /ratings/new.xml
  def new
    @rating = current_user.ratings.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/1/edit
  def edit
    @rating = current_user.ratings.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.xml
  def create
    @rating = current_user.ratings.build(params[:rating])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to(user_ratings_path(current_user), :notice => 'Rating was successfully created.') }
        format.xml  { render :xml => @rating, :status => :created, :location => @rating }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ratings/1
  # PUT /ratings/1.xml
  def update
    @rating = current_user.ratings.find(params[:id])

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        format.html { redirect_to(user_ratings_path(current_user), :notice => 'Rating was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.xml
  def destroy
    @rating = current_user.ratings.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to(user_ratings_path(current_user)) }
      format.xml  { head :ok }
    end
  end
  
  def user_comic_list
    users = User.where(:username => params[:user_name])
    @user = users.first if users.any?
    @ratings = @user.ratings.order("rating DESC") if @user
    @meta_title = I18n.t("layout.user_meta.title", :user_name => @user.username) if @user
    @meta_description = I18n.t("layout.user_meta.description", :user_name => @user.username) if @user
  end  
end
