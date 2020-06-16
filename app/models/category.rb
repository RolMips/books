# app/models/category.rb
class Category < ActiveRecord::Base
    has_many :books
end
