# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
    has_one_attached :eyecatch
    has_rich_text :content

    validates :title, presence: true
    validates :content, presence: true
    # validates :content, length: {minimum: 2 }
    # validates :content, uniqueness: true

    # validate :validate_title_and_content_length

    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user


    # private
    # def validate_title_and_content_length
    #     char_count = self.title.length + self.content.length
    #     errors.add(:content, '百文字以上入力してください') unless char_count > 100
    # end
end
