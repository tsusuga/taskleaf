require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    let(:user_a) {FactoryBot.create(:user, name: 'ユーザA', email: 'a@example.com')}
    let(:user_b) {FactoryBot.create(:user, name: 'ユーザB', email: 'b@example.com')}

    before do
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    context 'ユーザAがログインしているとき' do
      let(:login_user) {user_a}

      it 'ユーザAが作成したタスクが表示される' do
        # 作成済みのタスクの名称が画面上に表示されていることを確認
        expect(page).to have_content '最初のタスク'
      end
    end

    context 'ユーザBがログインしているとき' do
      let(:login_user) {user_b}
      it 'ユーザAが作成したタスクが表示されない' do
        # ユーザAが作成したタスクの名称が画面上に表示されないことを確認
        expect(page).to have_no_content '最初のタスク'
      end
    end
  end
end