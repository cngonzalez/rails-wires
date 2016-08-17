class User < ApplicationRecord
  has_many :pages
  has_many :likes
  has_many :liked_pages, through: :likes, source: :page
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
