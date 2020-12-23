# テーブル設計

## users
| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| nickname           | string  | null:false   |
| email              | string  | null:false   |
| encrypted_password | string  | null:false   |
| last_name          | string  | null:false   |
| first_name         | string  | null:false   |
| last_name_kana     | string  | null:false   |
| first_name_kana    | string  | null:false   |
| birth_day          | date    | null:false   |

### Association
- has_many :items
- has_many :orders

## items
| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| name        | string    | null:false                     |
| price       | integer   | null:false                     |
| explanation | text      | null:false                     |
| user        | reference | null: false, foreign_key: true |
| status_id   | integer   | null:false                     |
| post_fee_id | integer   | null:false                     |
| area_id     | integer   | null:false                     |
| post_day_id | integer   | null:false                     |
| category_id | integer   | null:false                     |

### Association
- belongs_to :user
- has_one :order


## orders
| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses
| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| postal_code   | string    | null:false                     |
| prefecture_id | integer   | null:false                     |
| city          | string    | null:false                     |
| block         | string    | null:false                     |
| building      | string    |                                |
| phone_number  | string    | null:false                     |
| order         | reference | null: false, foreign_key: true |

### Association
- belongs_to :order
