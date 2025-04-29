class UsersController < ApplicationController
def index
  matching_users = User.all

  @list_of_users = matching_users.order({ :username => :asc })

  render({ :template => "user_templates/index"})
end

def show 
  parameter = params.fetch("path_username")

  @the_user = User.where({ :username => parameter }).at(0)
  
  render({ :template => "user_templates/show"})

end

def create

end
end
