class UrlController < ApplicationController

  def index
      
  end

  def new
    @newurl = Url.new
  end

  def find
    codename = params[:id]
    url = Url.find_by_codename(codename)
    redirect_to('http://' + url.url)
  end

  def success
    @newurl = Url.find_by_id(params[:id])
  end

  def create
    @newurl = Url.new(params[:newurl])

    begin 
      @newurl.generate_codename()
    end while Url.exists?(:codename => @newurl.codename)

    if @newurl.save
      redirect_to(:action => 'success', :id => @newurl.id)
    else
      render('new')
    end
  end

  def show
    @url = Url.find_by_id(params[:id])
  end

  def list
    @urls = Url.all 
  end

=begin
Creating a unique id will be something like this
@uniqueObject = MyUniqueModel.new(modelParams)
@uniqueObject.uuid_column = generate_uuid() # whatever method you use for generating your uuid
while !uniqueObject.save # if at first it didn't save...
    uniqueObject.uuid_column = generate_uuid() # try, try again
end # should break out of the loop if the save succeeded.
=end
end
