class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      # テキストのためのカラムを追加した
      # userおよびprototypeを参照するための外部キーを記述した（references型を用いる）
      t.text :text, null: false
      t.references :user, foreign_key: true
      t.references :prototype, foreign_key: true
      t.timestamps
    end
  end
end
