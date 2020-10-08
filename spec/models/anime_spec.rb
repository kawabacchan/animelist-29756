require 'rails_helper'

RSpec.describe Anime, type: :model do
  before do
    @anime = FactoryBot.build(:anime)
  end

  describe "アニメ登録" do
    context "うまくいく時" do
      it "name, genre_id, score, memoが全てある時、登録できる" do
        expect(@anime).to be_valid
      end
      it "genre_idが1でも登録できる" do
        @anime.score = 1
        expect(@anime).to be_valid
      end
      it "scoreがなくても登録できる" do
        @anime.score = nil
        expect(@anime).to be_valid
      end
      it "memoがなくても登録できる" do
        @anime.memo = nil
        expect(@anime).to be_valid
      end
    end

    context "うまくいかない時" do
      it "nameが空の時、登録できない" do
        @anime.name = nil
        @anime.valid?
        expect(@anime.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが重複する時、登録できない" do
        another_anime = FactoryBot.build(:anime)
        another_anime.save
        @anime.name = another_anime.name
        @anime.valid?
        expect(@anime.errors.full_messages).to include("Name has already been taken")
      end
      it "genre_idが空だと登録できない" do
        @anime.genre_id = nil
        @anime.valid?
        expect(@anime.errors.full_messages).to include("Genre can't be blank")
      end

    end
  end
end
