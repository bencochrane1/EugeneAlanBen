class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :invitable, :database_authenticatable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable

  validates :email, presence: true
end
