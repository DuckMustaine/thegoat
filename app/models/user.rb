class User < ActiveRecord::Base

  has_many :editors

  enum role: [:normal_user, :admin]

  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :team, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
