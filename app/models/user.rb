class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,           presence: true
         validates :password,           format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
         validates :encrypted_password, presence: true
         validates :first_name,         presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
         validates :last_name,          presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
         validates :kana_first_name,    presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } 
         validates :kana_last_name,     presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } 
         validates :birthday,           presence: true

end