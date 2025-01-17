class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :prototypes, dependent: :destroy, class_name: 'Prototype'
  has_many :comments, dependent: :destroy

  validates :name, presence: true
end

