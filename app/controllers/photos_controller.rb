class PhotosController < ApplicationController
  def destroy
    photo = Photo.find(params[:id])
    page = photo.page
    photo.destroy!
    redirect_to edit_backoffice_page_path(page)
  end
end
