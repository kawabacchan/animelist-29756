require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'うまくいく時' do
      it 'nickname, email, password, password_confirmation, birthday, sex_idが全て存在する時' do
        expect(@user).to be_valid
      end
    end

    context 'うまくいかない時' do
      it 'nicknameが空の時' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空の時' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@を含まない場合は登録できない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空の時' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "1234a"
        @user.password_confirmation = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'password_confirmationが空の時' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'birthdayが空の時' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'sex_idが空の時' do
        @user.sex_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Sex can't be blank")
      end
      it 'sex_idが1の時' do
        @user.sex_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Sex must be other than 1")
      end

    end
  end
end