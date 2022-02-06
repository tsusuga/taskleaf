require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      # ユーザAを作成しておく
      # 作成者がユーザAであるタスクを作成しておく
    end

    context 'ユーザAがログインしているとき' do
      before do
        # ユーザAでログインする
      end

      it 'ユーザAが作成したタスクが表示される' do
        # 作成済みのタスクの名称が画面上に表示されていることを確認
      end
    end
  end
end