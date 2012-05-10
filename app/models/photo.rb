class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :flipbook => "75%", :card => "35%" }, :path=>":rails_root/public/images/:photo_session_id/:id/:id_:style.jpg", :url=>"/images/:photo_session_id/:id/:id_:style.jpg" #"photos/:photo_session_id/:id/:id_:style.jpg"
  belongs_to :photosession
end
