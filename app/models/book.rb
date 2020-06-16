# app/models/book.rb
class Book < ActiveRecord::Base
  belongs_to :category
  validates :title, presence:
  {message: "Le titre est obligatoire."}
  validates :title, uniqueness:
  {message: "Le titre doit être unique."}
  scope :french, -> { where(category_id: 1) }
  scope :world, -> { where(category_id: 2) }
end
