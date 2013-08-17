class UrlController < ApplicationController
  def index
      
  end

  def show
    @url = params[:id]
  end
end
