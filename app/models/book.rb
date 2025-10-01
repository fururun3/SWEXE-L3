class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :pages, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
