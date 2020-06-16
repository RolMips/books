# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  #before_action permet d’appeler la fonction set_current_user avant toutes les autres
  before_action :set_current_user
  def home
    @compteur = 5
  end
  def page1
    @NumeroPage = 1
  end
end
