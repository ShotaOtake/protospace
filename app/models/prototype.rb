class Prototype < ApplicationRecord
# Prototypeモデルにアソシエーションを記述
  belongs_to :user
  # has_one_attachedを使用してimageカラムとのアソシエーションを記述
  has_one_attached :image


  # Prototypeモデルに、プロトタイプの名称、キャッチコピー、コンセプト、画像に関するバリデーションを記述した
  with_options presence: true do
    validates :title
    validates :catch_copy
    validates :concept
    validates :image
  end
end
