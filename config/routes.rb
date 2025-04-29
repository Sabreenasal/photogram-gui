Rails.application.routes.draw do
post("/users", { :controller => "users", :action => "index" })

end
