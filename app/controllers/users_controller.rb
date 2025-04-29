class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index" })
  end

  def show
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)
   
    render({ :template => "user_templates/show" })
  end

  def add_user
    input_username = params.fetch("query_username")

    add_user = User.new
    add_user.username = input_username
    add_user.save

    redirect_to("/users/#{input_username}")
  end

  def update
    id = params.fetch("path_id")
    input_username = params.fetch("query_username")

    update_username = User.where({ :id => id }).at(0)
    update_username.username = input_username
    update_username.save

    redirect_to("/users/#{input_username}")
  end
end
