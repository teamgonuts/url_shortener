class UrlsController < ApplicationController

  def index
      render('new')
  end

  def find
    codename = params[:id]
    url = Url.find_by_codename(codename)
    redirect_to('http://' + url.url)
  end

  def success
    @newurl = Url.find_by_id(params[:id])
  end

  def new
    @newurl = Url.new
  end

  def create
    @newurl = Url.new(params[:newurl])

    if Url.exists?(:url => @newurl.url)
      redirect_to(:action => 'success', :id => Url.find_by_url(@newurl.url).id)
    else
      begin 
        @newurl.generate_codename()
      end while Url.exists?(:codename => @newurl.codename)

      if @newurl.save
        flash[:notice] = "Url successfully shortened."
        redirect_to(:action => 'success', :id => @newurl.id)
      else
        render('new')
      end
    end
  end

  def show
    @url = Url.find_by_id(params[:id])
  end

  def list
    @urls = Url.all 
  end

  def edit
    @url = Url.find_by_id(params[:id])
  end

  def update
    @url = Url.find_by_id(params[:id])

    if @url.update_attributes(params[:newurl])
      flash[:notice] = "Url successfully updated."
      redirect_to(:action => 'show', :id => @url.id)
    else
      flash[:notice] = "Url update failed."
      render('edit')
    end
  end

  def delete
    @url = Url.find_by_id(params[:id])
  end

  def destroy
    Url.find_by_id(params[:id]).destroy
    flash[:notice] = "Url successfully destroyed."
    redirect_to(:action => 'list')
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
