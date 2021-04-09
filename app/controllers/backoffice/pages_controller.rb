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
      render :edit
    else
      render action: 'new'
    end
  end

  def edit; end

  def update
    @page.slug = nil if @page.title != page_params[:title].downcase
    @page.title = page_params[:title].downcase

    if @page.update(page_params.except(:title))
      params[:photos]['image']&.each do |a|
        @photo = @page.photos.create!(image: a, page_id: @page.id)
      end
      photos
    else
      render action: 'new'
    end
  end

  def destroy
    @page.destroy!
    redirect_to '/backoffice'
  end

  def photos
    params[:photos].each do |id, values|
      photo = Photo.find(id)
      photo.main = values['main']
      photo.order = values['order']
      photo.save
    end
    redirect_to "/#{@page.slug}"
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
