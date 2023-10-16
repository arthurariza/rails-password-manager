class SharesController < ApplicationController
  before_action :set_password

  def new
    @users = User.excluding(current_user)
  end

  def create
    @password.user_ids = share_params[:user_ids].push(current_user.id)

    if @password.save
      redirect_to @password, notice: 'Password shared successfully.'
    else
      render :new, status: :unprocessable_entity, alert: 'Password not shared.'
    end
  end

  def destroy
    @password.user_passwords.where(user_id: params[:id]).destroy_all

    redirect_to @password
  end

  private

  def set_password
    @password = Password.find(params[:password_id])
  end

  def share_params
    params.require(:password).permit(user_ids: [])
  end
end
