class BackofficeController < ApplicationController
  before_action :authenticate_user!

  def index
    @pages = Page.all.order(:order)
  end
end
