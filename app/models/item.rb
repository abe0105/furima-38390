class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  has_one_attached :image
  belongs_to       :user
  belongs_to       :category  
  belongs_to       :commodity_condition   
  belongs_to       :shipping_charges 
  belongs_to       :prefecture    
  belongs_to       :days_to_ship



    validates :image,                  presence: true
    validates :name,                    presence: true
    validates :explanation,             presence: true
    validates :category_id,            presence: true
    validates :commodity_condition_id,  presence: true
    validates :shipping_charges_id,     presence: true
    validates :prefecture_id,           presence: true
    validates :days_to_ship_id,         presence: true 
    validates :price,                   presence: true


    validates :category_id,             numericality: { other_than: 0, message: 'select' }
    validates :commodity_condition_id,  numericality: { other_than: 0, message: 'select' }
    validates :shipping_charges_id,     numericality: { other_than: 0, message: 'select' }
    validates :prefecture_id,           numericality: { other_than: 0, message: 'select' }
    validates :days_to_ship_id,         numericality: { other_than: 0, message: 'select' }

    validates :price, numericality: { only_integer: true, message: 'Price Half-width number' }, inclusion: { in: (300..9_999_999), message: 'Out of setting range' }

end
