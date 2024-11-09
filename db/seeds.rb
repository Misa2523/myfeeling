# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#データ登録
##Adminレコードが存在しなければ新規作成し、存在していたら何も変更されない
Admin.find_or_create_by(email:'sample:example.com') do |admin|
  admin.password = '1232589'
end
