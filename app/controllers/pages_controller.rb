class PagesController < ApplicationController
  def work
    @pages = Page.all
  end

  def about; end

  def contact; end

  def show
    @page = Page.friendly.find(params[:slug])
    redirect_to root_path if @page.nil?
    @next_page = Page.where('id > ?', @page.id).first&.slug
    @prev_page = Page.where('id < ?', @page.id).last&.slug
  end
end
