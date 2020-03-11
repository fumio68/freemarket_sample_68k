# README

## アプリ概要

プログラミングスクールTECH CAMPのチーム開発で作成した、フリーマーケットサイトのコピーサイトです。

<img width="700" alt="スクリーンショット 2020-03-11 12 06 26" src="https://user-images.githubusercontent.com/59637985/76380265-a9e73400-6395-11ea-9d21-9bbf5ee14a3d.png">


### 接続先情報
 - URL 
   http://18.178.119.194//
   
   レスポンシブデザインには非対応のため、パソコンでご覧ください。
 - ID/Pass(Basic認証用)
   - ID: admin
   - Pass: 2222
 - テスト用アカウント等
   - 購入者用
     - メールアドレス: buyer_user@gmail.com
     - パスワード: buyer_user68k
     - 購入用カード情報
       - 番号：4242424242424242
       - 期限：4/24
       - セキュリティコード：123
   - 出品者用
     - メールアドレス名: seller_user@gmail.com
     - パスワード: seller_user68k
     
     確認後、ログアウト処理をお願いします（ログアウトは、マイページのサイドバー最下段からしていただけます）。

### 開発状況
 - 開発環境
   - Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
 - 開発期間と平均作業時間
   - 開発期間：約4週間
   - 1日あたりの平均作業時間：約9時間
 - 開発体制
   - 人数：5名
   - アジャイル型開発（スクラム）
   - Trelloによるタスク管理

### 担当箇所一覧と確認方法
 - DB設計
   - ER図の作成
   
 - 商品出品ページ(フロントエンド)
   - 出品者用アカウントでログイン後、http://18.178.119.194/items/new
   にアクセスするか、トップページの「出品する」をクリックするとご覧いただけます。
      - 実装内容
        - Haml,Scssを使用したマークアップ
   
 - 商品出品機能(バックエンド)
   - 商品出品ページで、写真や商品情報を入力して出品することができます。（出品画像のプレビューについては、他のチームメンバーが実装）
      - 実装内容
        - 商品写真は、fields_forを使って別テーブルに保存するように設定
        - カテゴリー欄はAjax通信を活用し、選択された親カテゴリーに対応した子カテゴリーの選択欄が動的に生成されるように作成（カテゴリー一覧           は、gem‘ancestry’を使用して作成しています。現時点では、レディース→トップス→Tシャツ/カットソー(半袖/袖なし)のみサイズ選択まで           入力していただけます）
        - gem’active hash’を導入し、発送元地域の都道府県一覧を作成
 
 - 商品出品機能エラーハンドリング(バックエンド)
    - jQueryを使用し、入力必須項目が入力されていない場合には、エラーメッセージを表示する機能を実装

### チーム開発を通じて得られたこと
 - チームとして工夫を行った点
   
   エラーなどが発生した時に、気軽にチーム内で相談できる雰囲気づくりを行いました。実際に協力してエラー解決を行う中で、自分の担当箇所以外についても自分ごととして問題解決に臨む体制を作ることができました。   
   また、メンバー全員が新技術に触れるように分担することで、新たな学びを得るとともに、一人一人が貢献できているという実感を持ちながら開発を進めることができました。

 - 個人として工夫を行った点
   
   私はスクラムマスターとして、チームメンバーがスムーズに開発に取り組めるような環境づくりに取り組みました。具体的には、デイリースクラムの資料を作成して全体の進捗と各メンバーのタスクを整理する他、エラーなどに苦戦しているメンバーのサポートを積極的に行いました。その結果、誰がどの作業を行っているのかわからなくなったり、一人で悩み続けたりする状況をなくし、チームとして最後まで快く開発を続けることができました。   
　 技術面では、2つのテーブルへのデータ保存、gem‘ancestry’・gem’activehash’との連携、Ajax通信などの複合的な処理が必要になる商品出品機能を手掛けることで、仮説と検証を繰り返し、一つ一つ問題解決をしていく能力を身に付けることができました。
  
 - 苦労した点
    - DB設計
    
      私自身が今回のフリマアプリのような多数のテーブルを使用するアプリの開発経験がなかったため、DB設計には苦戦しました。  
　チームメンバー全員で意見を出し合いながら、テーブルやカラムを決定していきましたが、次々と必要なテーブル名やカラム名が上がり、それが本当に必要なのか、どのような理由で必要なのかといった合意形成をすることに時間がかかりました。  
　約1日DB設計について議論し終えたあと、私はER図の作成を担当しましたが、議論の段階ではDBへの理解があまりできていないメンバーも見受けられたため、少しでも見やすくわかりやすいものにすることを意識して、ER図を作成しました（下図）。  
　開発中にテーブルやカラムの見直しの必要が出た時には、デイリースクラムの際に共有することで、チームメンバー全員がDBを理解した状態で開発を進めることができました。  
 
   - 商品出品機能の実装
　
      
      商品出品機能では、カテゴリー欄のAjax通信と、カラムのデータ型に合わせた値が保存できるようにすることに苦戦しました。  
　Ajax通信は、カリキュラムをこなしても理解が薄い部分だったため、情報収集をしながら、実装を進めました。検索したコードをコピーするだけでなく、その内容を理解しながら実装することで、チームメンバーからコードの内容の質問を受けた時にも、処理の流れを説明することができるようになりました。  
　また、値の保存については、integer型で保存するはずが文字列の値が送られてしまう場合などがあったため、binding.pryで検証を繰り返して正しい値が保存されるようにコードの修正を行いました。

   - チーム内の進捗管理と役割分担
　    
     マークアップとサーバーサイドを並行して進めることに加え、メンバー全員がマークアップとサーバーサイド両方の実装を行えるように分担することに苦慮しました。  
　私はスクラムマスターとして、チームメンバーの進捗管理や分担をしていたのですが、個人の作業スピードや理解度が違うため、適切な分担を行うのに注意が必要でした。特に、マークアップが終わっていないためにサーバーサイドに着手できないなどの状況にならないよう、全員の進捗と全体の実装の流れを把握するように努めました。また、個人の実力に見合った内容を割り振ることや、一部のメンバーに作業が集中しないようにも配慮しました。  
　その結果、メンバー全員が新技術に挑戦するように分担することができ、開発もスムーズに進めることができました。


## freemarket_sample_68k DB設計
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|last_name|string|null: false|
|j_family_name|string|null: false|
|j_last_name|string|null: false|
|b_year|integer|null: false|
|b_month|integer|null: false|
|b_date|integer|null: false|
|user_image|string||
### Association
- has_many :items
- has_many :cards
- has_many :purchases
- has_one :residence

### itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|content|text|null: false|
|brand|string||
|condition|string|null: false|
|shipping|string|null: false|
|shipping_area|string|null: false|
|days_to_ship|string|null: false|
|shipping_method|string|null: false|
|status|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id_1|integer|null: false|
|category_id_2|integer|null: false|
|category_id_3|integer|null: false|
|size_id|integer||
|category_id|references|null: false, foreign_key: true|
### Association
- has_many :item_images
- belongs_to :user
- belongs_to :category
- has_one :purchase

### categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items
- has_ancestry

### item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item

### purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|postcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string||
### Association
- belongs_to :user
- belongs_to :item

### residencesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|last_name|string|null: false|
|j_family_name|string|null: false|
|j_last_name|string|null: false|
|postcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

### cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user
