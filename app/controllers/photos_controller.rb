class PhotosController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :html, :js
  
  
  def new
    reset_session
    @photosession = Photosession.new
    @photosession.save
    session[:photosession_id] = @photosession.id
    logger.info 'photosession photos new'
    logger.info session[:photosession_id].to_s
    logger.info 'photos new'
  end
  
  def create
    @photo = Photo.new(params[:photo])
    @photo.image = File.new(upload_path)
    @photo.save

    #redirect_to @photo
    #respond_with @photo, :location => new_photo_path
  end
  
  def initiatesession
    @photosession = Photosession.new
    @photosession.save
    @photosession.id
    render :text=>'ok'   
  end

  def show
    logger.info "show"
    @photo = Photo.find(params[:id])
  end

  def redirectphotos
    @photos = Photo.all
    redirect_to photos_path
  end

  def index
    @photos = Photo.all
  end

  def upload
    File.open(upload_path, 'w') do |f|
      f.write request.raw_post.force_encoding("UTF-8")
    end
    render :text => "ok"
  end
  
  def print
    respond_to do |format|
      logger.info 'format.html'
      format.html #{render :html => 'www.yahoo.com'}
      logger.info 'format.js'
      format.js #{ render :js => "window.location.href = 'google.com'" }
    end
  end

  def createimage
    logger.info 'Creating image'
    logger.info session[:photosession_id].to_s
    logger.info 'session id'
    if(session[:photosession_id].nil?)
      debugger
      @session_photos = Photo.all[0, 10]
    else
      @session_photos = Photosession.find(session[:photosession_id]).photos
    end
#    redirect_to photos_path

    respond_to do |format|
      logger.info 'format.html'
      format.html #{render :html => 'www.yahoo.com'}
      logger.info 'format.js'
      format.js #{ render :js => "window.location.href = 'google.com'" }

    end
  end

  private

  def upload_path # is used in upload and create
    file_name = session[:session_id].to_s + '.jpg'
    File.join(Rails.root, 'public', 'uploads', file_name)
  end
  

end
