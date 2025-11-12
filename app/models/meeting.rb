class Meeting < ApplicationRecord
  # この面会は1つのペット(pet)に所属する
  belongs_to :pet
end