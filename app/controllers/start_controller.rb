class StartController < ApplicationController
  # The purpose of this controller is to initialize the ui, then pass to the next controller
  # as need be. Mixin the login and password for a given request if necessary
  def home
    respond_to do |format|
       # index.html.erb
      format.html { render "index.html.erb", layout: "start" }
    end
  end
  
  def plan
    @conferences = Conference.all
    respond_to do |format|
      # plan.html.erb
      format.html { render "plan.html.erb", layout: "start" }
    end
  end
  
end