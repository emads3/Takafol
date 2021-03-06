ActiveAdmin.register Charity do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :name, :address, :phone_number, :description, :reset_password_token, :reset_password_sent_at, :remember_created_at, :verified
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :name, :address, :phone_number, :description, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
