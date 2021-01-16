class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Userモデルにアソシエーション記述した
  has_many :prototypes

  # Userモデルに各カラムのバリデーションを記述（「emailとpasswordが空だと保存できない」というバリデーションは標準で用意されているため、記述する必要はない）
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
end
