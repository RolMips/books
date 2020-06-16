# app/models/user.rb
class User < ActiveRecord::Base
  validates :name, presence:
  {message: "Le nom est obligatoire."}
  validates :name, uniqueness:
  {message: "Le nom doit être unique."}
end
