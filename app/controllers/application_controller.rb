class ApplicationController < ActionController::Base
  include Pundit
    before_action  :configure_permitted_parameters, if: :devise_controller? 

    # def render_cases
    #   @cases =Case.all
    # end
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:national_id,:name ,:phone_number , :description ])
    end
end
