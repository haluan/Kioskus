module SessionsHelper
  def sign_in(user)
    cookies.permanent[:ingat_aku] = user.ingat_aku
    self.user_sekarang = user
  end
  
  def signed_in?
    !user_sekarang.nil?
  end
  
  def user_sekarang=(user)
        @user_sekarang = user
  end
  
  def user_sekarang
    @user_sekarang ||= User.find_by_ingat_aku(cookies[:ingat_aku])
  end
  
  def sign_out
    user_sekarang = nil
    cookies.delete(:ingat_aku)
  end
end
