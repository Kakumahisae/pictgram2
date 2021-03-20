class User < ApplicationRecord
  
  validates :name, presence: true
  validates :password, presence: true
  
  validates :email, presence: true
  # まず正規表現を左辺に代入。validates :カラム名, format: { with: 正規表現 }とすることで正規表現と属性が合致するか確認
  VALID_EMAIL_REGEX=/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}
  
  
  has_secure_password
  
end
