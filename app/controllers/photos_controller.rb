class PhotosController < ApplicationController
  def index
    render({ :template => "photo_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_records = Photo.where({ :id => the_id })

    @the_photo = matching_records.first

    render({ :template => "photo_templates/show" })
  end

  def create
    
  end
end
