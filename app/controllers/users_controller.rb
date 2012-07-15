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
    @user.birthday = Date.new(split[2].to_i, split[0].to_i, split[1].to_i)
  end
  @user.ip = request.env['REMOTE_ADDR']
  saved = @user.save
  if !saved
    notice = 'Le rêve a été correctement créé'+' mais l\'utilisateur existait déja'
    @dream.user = User.where(:ip => @user.ip, :username => @user.username).first
    if !@dream.user 
      format.html { redirect_to new_user_path, notice: 'L\'utilisateur existe déjà' }
    end
  end
  @dream.user ||= @user
  notice ||= 'Le rêve a été correctement créé'
  respond_to do |format|
   if @dream.save && @user.dreams.where("created_at >= ?",1.hour.ago).count <= 50
      format.html { redirect_to dreams_path, notice: notice }
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
