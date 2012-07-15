# encoding: utf-8
class UsersController < ApplicationController
def new
  @dream = Dream.new
  @user = User.new
  respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @user }
  end
end

def create
  @user = User.new(params[:user])
  @dream = Dream.new(params[:dream])
  split = params[:birthday].split('/')
  if split.size == 3
    @user.birthday = Date.new(split[2].to_i, split[1].to_i, split[0].to_i)
  end
  @dream.user = @user
  @user.ip = request.env['REMOTE_ADDR']
  respond_to do |format|
   if @user.save && @dream.save && @user.dreams.where("created_at >= ?",1.hour.ago).count <= 50
      format.html { redirect_to dreams_path, notice: 'Le rêve a été correctement créé' }
      format.json { render json: dreams_path, status: :created, location: users_path }
   elsif @user.dreams.where("created_at >= ?",1.hour.ago).count > 50 
      format.html { redirect_to dreams_path, notice: 'Vous avez créé trop de rêves !!' }
      format.json { render json: dreams_path.errors, status: :unprocessable_entity }
   else
      format.html { redirect_to dreams_path, notice: 'Une erreur s\'est produite' }
      format.json { render json: dreams_path.errors, status: :unprocessable_entity }
   end
  end
end

end
