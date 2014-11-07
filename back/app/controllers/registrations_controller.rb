class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource devise_parameter_sanitizer.sanitize(:sign_up)

    if resource.save
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        return render json: {success: true}
      else
        expire_session_data_after_sign_in!
        return render json: {success: true}
      end
    else
      clean_up_passwords resource
      return render json: {success: false}
    end
  end

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end
end
