class User::UserHobbiesController < ApplicationController
	def create
		@hobby = Hobby.find(params[:hobby_id])
        user_hobby = current_user.user_hobbies.new(hobby_id: @hobby.id)
        user_hobby.save
        render 'user/hobbies/create.js.erb' #viewの一番上の階層userからjsファイルの場所を指定して呼び出す
    end

    def destroy
    	@hobby = Hobby.find(params[:hobby_id])
        user_hobby = current_user.user_hobbies.find_by(hobby_id: @hobby.id)
        user_hobby.destroy
        render 'user/hobbies/destroy.js.erb'
    end

end
