class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250 }
  validates :summary, length: {maximum: 250}

  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  # validates :title, exclusion: { in: ["True Facts"] }
  validate :is_clickbaity?


    def is_clickbaity?
      words = ["Won't Believe", "Secret", "Top #{/[0-9]/}" ,"Guess"]
      if title != nil

      check_word = words.none? { |word| title.include?(word) }

       errors.add(:title, "Not a Click Bait!") if check_word
     end
  end
end
