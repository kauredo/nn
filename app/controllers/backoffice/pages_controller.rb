class Backoffice::PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_page, only: %I(edit update)

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.title = page_params[:title].downcase
    @page.save
    redirect_to "/#{@page.slug}"
  end

  def edit; end

  def update
    @page.title = page_params[:title].downcase
    @page.update(page_params.except(:title))
    redirect_to "/#{@page.slug}"
  end

  private

  def find_page
    @page = Page.friendly.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :models_name, :models_instagram, :image_height, :image_width, :number_rows_desktop, :number_rows_mobile, :is_slider)
  end
end
