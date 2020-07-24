require 'rails_helper'

describe User do
  describe '#create' do
    it 'ユーザー作成' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it 'メアドなしでは登録できません' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it 'パスワードなしでは登録できません' do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it '確認用パスワードなしでは登録できません' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it 'ニックネームなしでは登録できません' do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it '名前なしでは登録できません' do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it '苗字なしでは登録できません' do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it 'カナ名前なしでは登録できません' do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it 'カナ苗字なしでは登録できません' do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it '誕生日なしでは登録できません' do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it '重複したメアドでは登録できません' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it 'メアドは正しいフォーマットでないと登録できません' do
      user = build(:user, email: "aaa@gmail,com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it 'メアドは小文字で保存して登録可能' do
      user = create(:user, email: "AAA@gmail.com")
      expect(user.email).to eq("aaa@gmail.com")
    end

    it 'パスワードは７文字以上で登録可能' do
      user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
      user.valid?
      expect(user).to be_valid
    end

    it 'パスワードは７文字以下では登録できません' do
      user = build(:user, password: "aaa", password_confirmation: "aaa")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください", "は7文字以上で入力してください")
    end

    it '名前を英語で使用すると登録できません' do
      user = build(:user, first_name: "TARO")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it '苗字を英語で使用すると登録できません' do
      user = build(:user, last_name: "TANAKA")
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end

    it '名前をカナ以外を使用すると登録できません' do
      user = build(:user, first_name_kana: "たろう")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it '苗字をカナ以外で使用すると登録できません' do
      user = build(:user, last_name_kana: "たなか")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end
  end
end