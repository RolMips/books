# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def login
  end

  def list
    set_current_user
    @users = User.all.page(params[:page]).per(5)
    @user = User.new # afin d'exploiter le helper form_for
  end

  def show
    set_current_user
    @user = User.find(params[:id])
  end

  def create
    set_current_user
    @user = User.create name: params[:user_name], password:params[:user_password], role: params[:user_role]
    if @user.save
      flash[:success] = "Le nouveau utilisateur a été ajouté."
      redirect_to "/users"
    else
      @users = User.all.page(params[:page]).per(5)
      render :list
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/users"
  end

  def update
    set_current_user
    @user = User.find(params[:id])
    @user.name=params[:user_name]
    @user.password=params[:user_password]
    @user.role=params[:user_role]
    if @user.save
      flash[:success] = "L'utilisateur a été mis à jour."
      redirect_to "/users/#{params[:id]}"
    else
      render :show
    end
  end

  def logout
    if session[:user_id]
      session[:user_id] = nil
      flash[:info] = "Déconnexion réussie"
      redirect_to "/users/login"
    end
  end

  def check
    @current_user = User.where(name: params[:user_name], password: params[:user_password]).first
    if @current_user
      flash[:info] ="Connexion reussie"
      session[:user_id] = @current_user.id
      redirect_to :root
    else
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end

end
