class UploadImageFiledOnMovies < ActiveRecord::Migration[5.0]
  def change
    rename_column :movies, :poster_image_url, :upload_image
  end
end
