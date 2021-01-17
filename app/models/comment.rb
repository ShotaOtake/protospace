class Comment < ApplicationRecord
  # userおよびprototypeに対するアソシエーションを設定
  belongs_to :user
  belongs_to :prototype
end
