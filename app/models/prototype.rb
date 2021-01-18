class Prototype < ApplicationRecord
# Prototypeモデルにアソシエーションを記述
  belongs_to :user
  # has_one_attachedを使用してimageカラムとのアソシエーションを記述
  has_one_attached :image
  # commentに対するアソシエーションを設定（必要に応じてdependent: :destroyオプションを使用）
  # dependentオプションに:destroyを指定したときは、親モデルが削除されたとき、それに紐付ている子モデルも一緒に削除される
  has_many :comments, dependent: :destroy

  # Prototypeモデルに、プロトタイプの名称、キャッチコピー、コンセプト、画像に関するバリデーションを記述した
  with_options presence: true do
    validates :title
    validates :catch_copy
    validates :concept
    validates :image
  end
end
