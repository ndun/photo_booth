class AddPhotoSessionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photosession_id, :integer
  end
end