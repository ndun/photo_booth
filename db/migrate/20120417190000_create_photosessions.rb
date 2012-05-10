class CreatePhotosessions < ActiveRecord::Migration
  def change
    create_table :photosessions do |t|
      t.string :title
      t.timestamps
    end
  end
end
