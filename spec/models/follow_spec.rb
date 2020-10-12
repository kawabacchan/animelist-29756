require 'rails_helper'

RSpec.describe Follow, type: :model do
  before do
    @follow = FactoryBot.build(:follow)
  end

  describe 'フォロー登録' do
    context 'うまくいく時' do
      it 'friend_idが存在する時、登録できる' do
        expect(@follow).to be_valid
      end
    end

    context 'うまくいかない時' do
      it 'friend_idが空の時、登録できない' do
        @follow.friend_id = nil
        @follow.valid?
        expect(@follow.errors.full_messages).to include("Friend can't be blank")
      end
    end
  end
end
