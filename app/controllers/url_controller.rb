class UrlController < ApplicationController

  def index
      
  end

  def new
    @newurl = Url.new
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
