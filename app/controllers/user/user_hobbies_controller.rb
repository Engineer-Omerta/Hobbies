class User::UserHobbiesController < ApplicationController
	def create
		hobby = Hobby.find(params[:hobby_id])
        user_hobby = current_user.user_hobbies.new(hobby_id: hobby.id)
        user_hobby.save
        redirect_to user_hobby_path(hobby.id)
    end

    def destroy
    	hobby = Hobby.find(params[:hobby_id])
        user_hobby = current_user.user_hobbies.find_by(hobby_id: hobby.id)
        user_hobby.destroy
        redirect_to user_hobby_path(hobby.id)
    end
end
