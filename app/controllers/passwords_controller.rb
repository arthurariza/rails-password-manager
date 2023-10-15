class PasswordsController < ApplicationController
  def index
    @passwords = current_user.passwords
  end

  def new
    @password = Password.new
  end

  def create
    @password = current_user.passwords.create(password_params)

    if @password.persisted?
      redirect_to passwords_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:password).permit(:username, :password, :url)
  end
end
