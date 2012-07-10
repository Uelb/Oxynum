#encoding: utf-8

class DreamsController < ApplicationController
  def index
    @dreams = Dream.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dreams }
    end
  end

  def show
    @dream = Dream.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dream }
    end
  end

  def new
    @dream = Dream.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dream }
    end
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def create
    @dream = Dream.new(params[:dream])
    
    @dream.ip = request.env['REMOTE_ADDR']
    respond_to do |format|
     if @dream.save && Dream.where("created_at >= ?",1.hour.ago).count <= 50
        format.html { redirect_to dreams_path, notice: 'Le rêve a été correctement créé' }
        format.json { render json: dreams_path, status: :created, location: dreams_path }
     elsif Dream.where("created_at >= ?",1.hour.ago).count > 50 
        format.html { redirect_to dreams_path, notice: 'Vous avez créé trop de rêves !!' }
        format.json { render json: dreams_path.errors, status: :unprocessable_entity }
     else
        format.html { redirect_to dreams_path, notice: 'Une erreur s\'est produite' }
        format.json { render json: dreams_path.errors, status: :unprocessable_entity }
     end
    end
  end

  def update
    @dream = Dream.find(params[:id])

    respond_to do |format|
      if @dream.update_attributes(params[:dream])
        format.html { redirect_to dreams_path, notice: 'dream was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: dreams_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dream = Dream.find(params[:id])
    @dream.destroy

    respond_to do |format|
      format.html { redirect_to dreams_url }
      format.json { head :no_content }
    end
  end
end
