class UsersController < ApplicationController
  def index
    render({ :template => "user_templates/index" }) 
  end

  def show
    the_username = params.fetch("path_username")

    matching_records = User.where({ :username => the_username })

    @the_user = matching_records.first

    # if @the_user == nil
    #   redirect_to("/404")
    # else
    render({ :template => "user_templates/show" }) 
    # end

  end

  def create
    new_user = User.new

    new_user.username = params.fetch("input_username")

    new_user.save

    redirect_to("/users")
  end
end
