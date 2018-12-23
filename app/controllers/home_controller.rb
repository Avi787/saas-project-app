class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]

  def index
    if current_user
      if session[:tentant_id]
        Tenant.set_current_tenant session[:tentant_id]
      else
        Tenant.set_current_tenant current_user.tentants.first
      end
      
      @tenant = Tenant.current_tenant
      params[:tenant_id] = @tenant.id
    end
  end
end
