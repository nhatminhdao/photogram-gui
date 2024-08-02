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

  def create
    new_photo = Photo.new

    new_photo.image = params.fetch("input_image")
    new_photo.caption = params.fetch("input_caption")
    new_photo.owner_id = params.fetch("input_owner_id")
    
    new_photo.save

    redirect_to("/photos/#{new_photo.id}")
  end

  def update
    the_id = params.fetch("path_id")

    matching_records = Photo.where({ :id => the_id })

    the_photo = matching_records.first
    
    the_photo.image = params.fetch("input_image")
    the_photo.caption = params.fetch("input_caption")

    the_photo.save

    redirect_to("/photos/#{the_id}")
  end

  def comment
    new_comment = Comment.new

    new_comment.photo_id = params.fetch("input_photo_id")
    new_comment.author_id = params.fetch("input_author_id")
    new_comment.body = params.fetch("input_comment")
    
    new_comment.save

    redirect_to("/photos/#{params.fetch("input_photo_id")}")
  end
end
