Rails.application.routes.draw do

  get("/", { :controller => "duets", :action => "index" })

  # Routes for the Talent resource:

  # CREATE
  post("/insert_talent", { :controller => "talents", :action => "create" })
          
  # READ
  get("/talents", { :controller => "talents", :action => "index" })
  
  get("/talents/:path_id", { :controller => "talents", :action => "show" })
  
  # UPDATE
  
  post("/modify_talent/:path_id", { :controller => "talents", :action => "update" })
  
  # DELETE
  get("/delete_talent/:path_id", { :controller => "talents", :action => "destroy" })

  #------------------------------

  # Routes for the Instrument resource:

  # CREATE
  post("/insert_instrument", { :controller => "instruments", :action => "create" })
          
  # READ
  get("/instruments", { :controller => "instruments", :action => "index" })
  
  get("/instruments/:path_id", { :controller => "instruments", :action => "show" })
  
  # UPDATE
  
  post("/modify_instrument/:path_id", { :controller => "instruments", :action => "update" })
  
  # DELETE
  get("/delete_instrument/:path_id", { :controller => "instruments", :action => "destroy" })

  #------------------------------

  # Routes for the Request resource:

  # CREATE
  post("/insert_request", { :controller => "requests", :action => "create" })
          
  # READ
  get("/requests", { :controller => "requests", :action => "index" })
  
  get("/requests/:path_id", { :controller => "requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_request/:path_id", { :controller => "requests", :action => "update" })
  
  # DELETE
  get("/delete_request/:path_id", { :controller => "requests", :action => "destroy" })

  #------------------------------

  # Routes for the Member resource:

  # CREATE
  post("/insert_member", { :controller => "members", :action => "create" })
          
  # READ
  get("/members", { :controller => "members", :action => "index" })
  
  get("/members/:path_id", { :controller => "members", :action => "show" })
  
  # UPDATE
  
  post("/modify_member/:path_id", { :controller => "members", :action => "update" })
  
  # DELETE
  get("/delete_member/:path_id", { :controller => "members", :action => "destroy" })

  #------------------------------

  # Routes for the Duet resource:

  # CREATE
  post("/insert_duet", { :controller => "duets", :action => "create" })
          
  # READ
  get("/duets", { :controller => "duets", :action => "index" })
  
  get("/duets/:path_id", { :controller => "duets", :action => "show" })
  
  # UPDATE
  
  post("/modify_duet/:path_id", { :controller => "duets", :action => "update" })
  
  # DELETE
  get("/delete_duet/:path_id", { :controller => "duets", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Song resource:

  # CREATE
  post("/insert_song", { :controller => "songs", :action => "create" })
          
  # READ
  get("/songs", { :controller => "songs", :action => "index" })
  
  get("/songs/:path_id", { :controller => "songs", :action => "show" })
  
  # UPDATE
  
  post("/modify_song/:path_id", { :controller => "songs", :action => "update" })
  
  # DELETE
  get("/delete_song/:path_id", { :controller => "songs", :action => "destroy" })

  #------------------------------

end
