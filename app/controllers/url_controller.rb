class UrlController < ApplicationController

  def index
      
  end

  def new
    
  end

  def show
    @url = params[:id]
  end
end
