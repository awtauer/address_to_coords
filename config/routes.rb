AddressToCoords::Application.routes.draw do
  get("/coords", { :controller => "addresses", :action => "fetch_coordinates" })

  get ("/coords/:user_input", :controller => "submission", :action => "show")

end
