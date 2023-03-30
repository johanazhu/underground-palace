class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  attr_accessor :login
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :username, :email, :password, :password_confirmation, :remember_me,
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }


  
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy


  has_and_belongs_to_many :following,
  class_name: 'User',
  join_table: 'relationships',
  foreign_key: 'follower_id',
  association_foreign_key: 'following_id'

  has_and_belongs_to_many :followers,
  class_name: 'User',
  join_table: 'relationships',
  foreign_key: 'following_id',
  association_foreign_key: 'follower_id'

end
