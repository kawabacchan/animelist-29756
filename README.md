# アプリケーション名
animelist-29756

# アプリケーション概要
視聴したアニメやこれから視聴する予定のアニメをリスト化するアプリケーションです。

# 本番環境
https://animelist-29756.herokuapp.com/

Basic認証

* ユーザー名: kawabata
* パスワード: 1234

サンプルユーザー

* ユーザー名： サンプル
* メールアドレス: sample@sample.com
* パスワード： 123456

サンプルユーザーの友達

* ユーザー名： 友人A
* メールアドレス: yujina@yujina.com
* パスワード： 123456


# 制作背景（意図）
近年、NETFLIXやU-NEXT、Amazon　Prime　VideoなどのVODの発達により、気軽に多くのアニメを見ることができるようになってきております。  
ある調査結果では日本人の3500万人がアニメを視聴しているというデータを出しています。  
これほど多くの人に愛され、趣味にしている人も少なくないアニメにおいて、日常でアニメの話をするシーンが今後増えると予測しました。  
日常でおすすめのアニメを聞かれたとして、沢山のアニメを見ている人ほど即答は難しくなります。  
そこでアニメのタイトルを点数やジャンルをつけて管理できるツールが必要不可欠だと考えました。  


# DEMO

### ユーザー登録機能

![training](https://gyazo.com/c96ab0a7d9a106a584fa40a3a3ebc009.gif)

### リスト登録

![training](https://gyazo.com/5da32c64ac7966ede202cd4e5fb96f4e.gif)

### リスト中にアニメ登録

![training](https://gyazo.com/aa69bb98cfe49ba556469e3e73ffe8ff.gif)

![training](https://gyazo.com/97b9d99efc635b7c1ee320b1cd3b6850.gif)

### 友達検索機能
友達のIDを事前に教えてもらう必要があります。
友達が公開中のリストのみ見ることができます。
![training](https://gyazo.com/fa3423a6d5efc94242c0e28f320bc7ba.gif)

友達が非公開にしているものは見れません。
![training](https://gyazo.com/7428f342cadcfd509931c6e75ea8e0d2.gif)

### フォロー機能
友達検索後の「フォローする」ボタンを押すと、フォローに追加されます。
![training](https://gyazo.com/392bed80edbe2f29533f0159d9d06824.gif)

フォローに追加された友達のページには検索せずに訪問することができます。
![training](https://gyazo.com/e7e995466c5acf3d0aef72ea41ca355e.gif)

### 年別の放送アニメ表示機能（2014 ~ 2020年） <= 2020.11.7追加実装
![training](https://gyazo.com/cb6d6e44221b9e379f55ae266033d9c4.gif)

# 使用技術(開発環境)

### バックエンド
Ruby, Ruby on Rails

### フロントエンド
HTML, CSS, JavaScript

### データベース
MySQL

### API
Project-ShangriLa/sora
https://github.com/Project-ShangriLa/sora

### Webサーバー(本番環境)
Heroku

### アプリケーションサーバ(本番環境)
Heroku

### データベース(本番環境)
Heroku, AWS S3(画像)

### ソース管理
GitHub, GitHubDesktop

### テスト
RSpec

### エディタ
VSCode

# 開発予定

### APIを用いた放送アニメ表示機能
~~APIを用いて、年別で検索すると、検索した年の放送アニメの一覧が表示される機能の実装を考えています。~~ 2020.11.7実装完了

### AWSを使ったデプロイ
本アプリケーションはHerokuにデプロイしていますが、AWSを学習後、EC2にデプロイを行う予定です

### ☆機能
リストのアニメにお気に入りを入れる機能です。お気に入りしたアニメをすぐに見つけることができることを想定しています。

### ハッシュタグ機能
アニメのジャンルをハッシュタグで調べることで、指定したジャンルのアニメのみを検索・表示することを想定しています。


# ER図
![training](https://gyazo.com/77ef6a9486a0160baee968d6d463fe82.png)

# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| birthday   | date    | null: false |
| sex_id     | integer | null: false |
| public_uid | string  | null: false |

### association
- has_many :lists
- has_many :follows


## lists テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| public_id | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### association
- belongs_to :user
- has_many :animes


## animes テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| genre_id | integer    | null: false                    |
| score    | integer    | null: false                    |
| memo     | text       | null: false                    |
| list     | references | null: false, foreign_key: true |

### association
- belongs_to :list


## follows

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| friend_id | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### association
- belongs_to :user
