require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @list = FactoryBot.build(:list)
  end

  describe "リストの作成" do
    context "うまくいく時" do
      it "name, public_id, user_idが全て存在する時" do
        expect(@list).to be_valid
      end
    end

    context "うまくいかない時" do
      it "nameが空の時" do
        @list.name = nil
        @list.valid?
        expect(@list.errors.full_messages).to include("Name can't be blank")
      end
      it "public_idが空の時" do
        @list.public_id = nil
        @list.valid?
        expect(@list.errors.full_messages).to include("Public can't be blank")
      end
      it "public_idが1の時" do
        @list.public_id = 1
        @list.valid?
        expect(@list.errors.full_messages).to include("Public must be other than 1")
      end
    end
  end
end
