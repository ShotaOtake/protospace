class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      # マイグレーションファイルに、プロトタイプの名称、キャッチコピー、コンセプトのためのカラムを追加
      t.string :title, null: false
      t.text :catch_copy, null: false
      t.text :concept, null: false
      # マイグレーションファイルに、userを参照するための外部キーを記述（references型を用いる）
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
