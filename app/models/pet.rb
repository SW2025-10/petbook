class Pet < ApplicationRecord
  # このペットは多くの面会(meetings)を持つことができる
  has_many :meetings
  
  # このペットは1つの画像(main_image)を持つ
  # (Active Storage の設定)
  has_one_attached :main_image
end