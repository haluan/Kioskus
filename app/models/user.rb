class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :alamat, :email,
   :ingat_aku, :kota, :nama, :password, :password_confirmation, :provinsi,:photo
   
   has_attached_file :photo,:styles => { :small => "150x150>" }
    
   before_save {|member| member.email=email.downcase}
  before_save :create_ingat_aku
  validates :password, presence: true, length: {minimum: 6}, if: :haruskah_validasi?
  validates :password_confirmation, presence: true, if: :haruskah_validasi?
  EMAIL_VALID = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: EMAIL_VALID}, uniqueness: {case_sensitive: false}  
  has_attached_file :photo, styles: { small: "150x150", thumb: "130x130" }
  
  def self.pelanggan(date)
    where("admin!='t' and date(created_at) = ?",date).count(:id)
  end
  
  private
  def haruskah_validasi?
       new_record?
    end
    def create_ingat_aku
      self.ingat_aku = SecureRandom.urlsafe_base64
    end
    
    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
    
    def beneran_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
  
end
