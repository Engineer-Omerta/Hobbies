class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	#devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行される

	def after_sign_in_path_for(resource) #ログイン時にadminじゃなければuser_items_pathへ。そうでなければadmin_items_pathへ。
	    if params[:admin] == nil
	       user_home_index_path
	    else
	       new_admin_category_path
	    end
	end

    def after_sign_out_path_for(resource)
        user_home_top_path
    end

	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_ruby,
				:first_name_ruby, :nick_name, :user_location, :user_detailed_location])
		end
		def authenticate
  			redirect_to user_home_top_path unless user_signed_in?
		end
end