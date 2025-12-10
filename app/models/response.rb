class Response < ApplicationRecord
  belongs_to :survey
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  # 診断結果を計算
  def evaluate_result!
    self.total_score = answers.sum(:score)

    self.result =
      case total_score
      when 0
        "資格なし"
      when 1..3
        "ハムスター"
      when 4..6
        "ネコ"
      when 7..10
        "イヌ"
      else
        "判定不可"
      end

    save!
  end
end
