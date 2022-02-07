# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   def create
    self.resource = warden.authenticate!(auth_options)
    if current_user.first_name.blank?
      flash[:notice] = t('flash.welcome.no_name')
    else
      flash[:notice] = t('flash.welcome.with_name', name: current_user.first_name)
    end
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end
end
