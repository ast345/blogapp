require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'タイトルと内容が表示されている場合' do
    let!(:user) do
      User.create!({
        email: 'd@d.com',
        password: 'password'
      })
    end

    let!(:article) do
      user.articles.build({
        title: Faker::Lorem.characters(number: 10),
        content: Faker::Lorem.characters(number: 300)
      })
    end

    it 'タイトルと内容が入力されていれば、記事を保存できる' do
      expect(article).to be_valid
    end
  end

end
