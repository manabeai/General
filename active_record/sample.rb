require "active_record"

# SQLiteデータベースに接続
ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  host: "172.17.0.2",
  username: "root",
  password: "password",
  database: "sample",
  port: 3306,
)
# schema_migrationsテーブルを作成
ActiveRecord::Schema.define do
  create_table :schema_migrations, id: false do |t|
    t.string :version, null: false
  end
end

puts "schema_migrationsテーブルが作成されました。"
