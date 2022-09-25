class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,           presence: true
         validates :password,           format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
         
         validates :first_name,         presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: 'Full-width characters' }
         validates :last_name,          presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: 'Full-width characters' }
         validates :kana_first_name,    presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } 
         validates :kana_last_name,     presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } 
         validates :birthday,           presence: true

end
