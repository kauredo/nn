class PagesController < ApplicationController
  def work
    @pages = Page.sort_order
  end

  def about; end

  def contact; end

  def show
    @page = Page.friendly.find(params[:slug])
    redirect_to root_path if @page.nil?
    @next_page = Page.where('pages.order > ?', @page.order).order(:order).first
    @prev_page = Page.where('pages.order < ?', @page.order).order(:order).last
  end
end
