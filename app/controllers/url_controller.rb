class UrlController < ApplicationController

  def index
      
  end

  def new
    
  end

  def show
    @url = params[:id]
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
