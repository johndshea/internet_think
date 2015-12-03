class InquirerSessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(curiosities_path, notice: 'Logged in successfully.')
    else
      flash.now.alert = "Login failed."
      # render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:curiosities, notice: 'Logged out!')
  end
end
