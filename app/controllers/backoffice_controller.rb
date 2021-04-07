class BackofficeController < ApplicationController
  def index
    @pages = Page.all
  end
end
