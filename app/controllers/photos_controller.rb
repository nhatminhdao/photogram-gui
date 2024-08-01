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

  def destroy
    the_id = params.fetch("path_id")

    matching_records = Photo.where({ :id => the_id })

    the_photo = matching_records.first
    
    the_photo.destroy

    redirect_to("/photos")
  end

  # def update
  #   the_id = params.fetch("path_id")

  #   matching_records = Photo.where({ :id => the_id })

  #   the_photo = matching_records.first
    
  #   the_photo.image = params.fetch("input_image")
  #   the_photo.caption = params.fetch("input_caption")

  #   redirect_to("/photos/#[the_id]")
  # end
end
