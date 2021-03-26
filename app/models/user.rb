class User < ApplicationRecord
  
  validates :name, presence: true, length: {minimum:3} 
  
  #最初に書いたやつ
  #VALID_PASSWORD_REGEX=/\A[a-z0-9]+\z/
  #validates :password, format: {with: VALID_PASSWORD_REGEX}
  #validates :password, length: {minimum: 8, maximum: 32, allow_blank: true}
  
  
  VALID_PASSWORD_REGEX = /\A(?=\d{0,99}+[a-z])(?=[a-z]{0,99}+\d)[a-z\d]{8,100}+\z/i
  validates :password, presence: true, length: { minimum: 8, maximum: 32}, format: { with: VALID_PASSWORD_REGEX , message: :invalid_password}  
  
  # まず正規表現を左辺に代入。validates :カラム名, format: { with: 正規表現 }とすることで正規表現と属性が合致するか確認
  VALID_EMAIL_REGEX=/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}
  validates :email, presence: true
 
  has_secure_password
  
  has_many :topics
  
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  
  has_many :comments
 
  
end
