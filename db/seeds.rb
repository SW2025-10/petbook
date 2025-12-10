# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# アンケート作成
survey = Survey.create!(title: "ペット適性診断")

# 質問作成
questions = [
  "毎日30分は動物の世話をする時間が取れますか？",
  "掃除をまめにできますか？",
  "騒音に寛容ですか？",
  "匂いへの耐性がありますか？",
  "散歩できる体力がありますか？",
  "出張や旅行が少ないですか？",
  "動物アレルギーは無いですか？",
  "金銭的に月1万円以上かけられますか？",
  "動物の抜け毛が気になりませんか？",
  "人懐っこい動物が好きですか？"
]

questions.each do |q|
  survey.questions.create!(content: q)
end

