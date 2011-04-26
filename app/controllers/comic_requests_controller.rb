class ComicRequestsController < ApplicationController
  # GET /comic_requests
  # GET /comic_requests.xml
  def index
    @comic_requests = ComicRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comic_requests }
    end
  end

  # GET /comic_requests/1
  # GET /comic_requests/1.xml
  def show
    @comic_request = ComicRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comic_request }
    end
  end

  # GET /comic_requests/new
  # GET /comic_requests/new.xml
  def new
    @comic_request = ComicRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comic_request }
    end
  end

  # GET /comic_requests/1/edit
  def edit
    @comic_request = ComicRequest.find(params[:id])
  end

  # POST /comic_requests
  # POST /comic_requests.xml
  def create
    @comic_request = ComicRequest.new(params[:comic_request])

    respond_to do |format|
      if @comic_request.save
        format.html { redirect_to(new_comic_request_path, :notice => I18n.t('comic_requests.submitted')) }
        format.xml  { render :xml => @comic_request, :status => :created, :location => @comic_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comic_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comic_requests/1
  # PUT /comic_requests/1.xml
  def update
    @comic_request = ComicRequest.find(params[:id])

    respond_to do |format|
      if @comic_request.update_attributes(params[:comic_request])
        format.html { redirect_to(@comic_request, :notice => 'Comic request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comic_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comic_requests/1
  # DELETE /comic_requests/1.xml
  def destroy
    @comic_request = ComicRequest.find(params[:id])
    @comic_request.destroy

    respond_to do |format|
      format.html { redirect_to(comic_requests_url) }
      format.xml  { head :ok }
    end
  end
end
