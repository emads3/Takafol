class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
      params.require(:donor).permit(:email, :password, :national_id)
    end
end
