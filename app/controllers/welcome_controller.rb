class WelcomeController < ApplicationController
  def index
    if signed_in?
    @locations = Location.near("#{user_sekarang.alamat},#{user_sekarang.kota},#{user_sekarang.provinsi}",10,order: :distance)
     #@locations=Location.all
    else
      @locations=Location.all.to_gmaps4rails
    end
    render 'index'
  end
  
  
end
