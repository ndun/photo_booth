class PhotosessionsController < ApplicationController
  respond_to :html, :js
   
  def new
    @photosession = Photosession.new
     
  end
   
  def create
    @photosession = Photosession.new
    @photosession.save
    respond_to do |format|
      format.html 
      format.js 
    end
  end
   
  def index
    respond_to do |format|
      format.html 
      format.js 
    end   
  end
   
  def show
    @session = Photosession.find(params[:id])
    @photos = @session.photos
    respond_to do |format|
      format.html
      format.js
    end
  end
   
end