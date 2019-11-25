class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_hobbies, dependent: :destroy
  has_many :hobbies, through: :user_hobbies #top/indexでuser.hobbiesを可能にする
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy

  #下記からフォローフォロワー機能の記述
  #フォローする側のUserからみたRelationshipをactive_relationship
  #フォローされる側のUserからみたRelationshipをpassive_relationshipとしている
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親は　　↑following_id(フォローする側)
  has_many :followings, through: :active_relationships, source: :follower
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」とrelationshipモデルで定義している

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親は　↑follower_id(フォローされる側)
  #フォローする側とされる側で二通りのhas_many :relationshipsを書きたいが、名前被りの為無理。なので上記の様に名前変更している
  #ただしそれでは外部キーの情報が足りないので上記の様にforeign_keyを設定している
  has_many :followers, through: :passive_relationships, source: :following
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」とrelationshipモデルで定義している
  attachment :user_icon

  validates :last_name, presence: :true
  validates :first_name, presence: :true
  validates :last_name_ruby, presence: :true
  validates :first_name_ruby, presence: :true
  validates :nick_name, presence: :true
  validates :user_location, presence: :true
  validates :user_introduction, presence: :true
  validates :user_stance, presence: :true

  acts_as_paranoid

  def followed_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザーが、フォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: user.id).present?
  end

  def last_message(current_user, user) #ここの引数はmatch.htmlのuser.last_message()の引数の事
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: user.id)
     @currentUserEntry.each do |cu| #current_userのEntryを全て取り出す
        @userEntry.each do |u| #@userのEntryを全て取り出す
          if cu.room_id == u.room_id then #取り出した互いのEntryのroom_idが共通していれば下記を実行する (thenとは条件式がtrueなら下記を実行するという意味)
             @roomId = cu.room_id #互いのroom_idが共通していればroom_idにそのidを入れてやる
          end
        end
      end
      if Message.where(room_id: @roomId).last
        message_text = Message.where(room_id: @roomId).last #messageレコードの最後を取得
        return message_text.message
      else
        message_body = "まだメッセージのやりとりがありません。"
        return message_body
      end
    #selfはここではuserの事。
    #find_byでそのメッセージのルームIDを特定して、かつその最後の一件を取得する
    #returnでその行の内容をviewに返す　今定義したmessageの中のmessageカラムを呼び出している
  end

  def last_message_time(current_user, user)
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: user.id)
     @currentUserEntry.each do |cu| #current_userのEntryを全て取り出す
        @userEntry.each do |u| #@userのEntryを全て取り出す
          if cu.room_id == u.room_id then #取り出した互いのEntryのroom_idが共通していれば下記を実行する (thenとは条件式がtrueなら下記を実行するという意味)
             @roomId = cu.room_id #互いのroom_idが共通していればroom_idにそのidを入れてやる
          end
        end
      end
      if message_time = Message.where(room_id: @roomId).last
        return message_time.created_at.strftime("%m/%d %H:%M")
      else
        message_time = ""
        return message_time
      end
  end
end
