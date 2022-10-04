# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@test',
   password: 'testtest'
)

Customer.create!(
   email: 'test1@test.com',
   password: 'test01',
   family_name_kanji: '山田',
   first_name_kanji: '太郎',
   family_name_kana: 'ヤマダ',
   first_name_kana: 'タロウ',
   postal_code: '123456',
   user_address: 'tokyo',
   tele_number: '987654321',
)

Genre.create!(
   genre_name: 'ケーキ',
   created_at: "2022-09-29 16:58:56",
   updated_at: "2022-09-29 16:58:57"
)

Item.create!(
   genre_id: 1,
   product_name: 'ナガノケーキ',
   product_description: 'これはナガノケーキです。',
   tax_excluded: 1000,
   sale_status: 0,
   created_at: "2022-09-29 16:58:56",
   updated_at: "2022-09-29 16:58:57"
)