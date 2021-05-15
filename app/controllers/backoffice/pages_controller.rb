class Backoffice::PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_page, only: %I(edit update photos destroy)

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.title = page_params[:title].downcase
    if @page.save
      params[:photos]['image']&.each do |a|
        @photo = @page.photos.create!(image: a, page_id: @page.id)
      end
      redirect_to edit_backoffice_page_path(@page)
    else
      render action: 'new'
    end
  end

  def edit; end

  def update
    if page_params[:title].present?
      @page.slug = nil if @page.title != page_params[:title].downcase
      @page.title = page_params[:title].downcase

      if @page.update(page_params.except(:title)) && params[:photos]
        params[:photos]['image']&.each do |a|
          @photo = @page.photos.create!(image: a, page_id: @page.id)
        end
        photos
      else
        redirect_to edit_backoffice_page_path(@page)
      end
    else
      @page.update_attribute('order', page_params[:order])
    end
  end

  def destroy
    @page.destroy!
    redirect_to '/backoffice'
  end

  def photos
    new_images = []
    params[:photos].each do |id, values|
      if id == 'image'
        new_images << id
        next
      end

      photo = Photo.find(id)
      photo.main = values['main']
      photo.order = values['order']
      photo.save
    end
    if new_images.present?
      redirect_to edit_backoffice_page_path(@page)
    else
      redirect_to "/#{@page.slug}"
    end
  end

  private

  def find_page
    @page = Page.friendly.find(params[:id])
  end

  def page_params
    params.require(:page).permit(
      :title,
      :models_name,
      :models_instagram,
      :image_height,
      :image_width,
      :number_rows_desktop,
      :number_rows_mobile,
      :is_slider,
      :order,
      photos: [
        :id,
        :page_id,
        :image,
        :main,
        :order
      ]
    )
  end
end
