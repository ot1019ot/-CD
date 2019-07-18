class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
<<<<<<< HEAD
  before_action :set_search 
=======
  before_action :set_search
>>>>>>> aki/master

  def authenticate_user
    unless current_user
      flash[:notice] = "ログインが必要です"
      redirect_to new_admin_registration_url
    end
  end

  def set_search
	  @search = Item.ransack(params[:q])
  	@result = @search.result

  end

  #binding.pry
  # private
  #   def search_params
  # 	params.require(:search).permit(:disk_name, :disk_image, :stock, :price, :item_status)
  #   end

  protected
    def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number])
	  devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
	  devise_parameter_sanitizer.permit(:account_update,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number])
    end
end
