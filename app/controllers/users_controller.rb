class UsersController < ApplicationController
    
    def signup
    end
    
    def signed
        
       # puts params[:name]
       # puts params[:email]
       # puts params[:password]
        user = User.new({name: params[:name], email:params[:email], password:params[:password]})

        user.profile = Profile.new
        user.save
        user.profile.educations.create
        user.profile.experiences.create
      # user.profile.experiences= Experience.new
      #  user.profile.experiences.projects.create
        flash[:success] = "User Created !!."
        redirect_to login_url
    end
end

#      params[:name] .   params[:email] .    params[:password]