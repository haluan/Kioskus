class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      #sign in  berhasil
      sign_in user
      redirect_to root_path
    else
      #sig in gagal
      redirect_to signin_path, notice: 'email/password salah'
    end
  end
  def destroy
    sign_out    
    redirect_to root_path
  end
end
