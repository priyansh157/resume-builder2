class ProfilesController < ApplicationController
    include HomeHelper
    include ProfilesHelper

    before_action :logged_in_user, only: [:update]
    before_action :correct_user,   only: [:update]
     
    def copy
    var copyText = document.getElementById("myInput");
    copyText.select();
    copyText.setSelectionRange(0, 99999); 
    navigator.clipboard.writeText(copyText.value);
    #alert("Copied the text: " + copyText.value);
    end

    def update
       # current_user.gravatar.attach(params[:avatar])
        
       updated_profile_params = update_array_attributes_in_params(profile_params)
        @profile = Profile.find(params[:id])
    #    @exp = @profile.find(params[:id])
        if @profile.update(updated_profile_params)
            flash[:success] = "Profile updated successfully."
            redirect_to edit_url
        else
            flash[:danger] = "Profile update failed."
            redirect_to root_url
        end
    end

    def correct_user
        @profile = Profile.find(params[:id])
        @user = User.find(@profile.user_id)
        redirect_to(root_url) unless @user == current_user
    end

    private
        def profile_params
            params.require(:profile).permit(:name, :job_title, :total_experience, :overview, 
                :career_highlights, :primary_skills, :secondary_skills,
                :educations_attributes => [ :id, :school, :degree, :description, :start, :end, :_destroy]
            #    :experiences_attributes => [ :id, :company, :position, :description, :startdate, :enddate, :_destroy]
            )
        end
        def experience_params
            params.require(:profile).permit(:id, :company, :position, :description, :startdate, :enddate)
          end
end
