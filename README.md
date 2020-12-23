# テーブル設計

## users
| Column             | Type    | Options    |
| ------------------ | ------- | ---------- |
| nickname           | string  | null:false |
| email              | string  | null:false |
| encrypted_password | string  | null:false |
| last_name          | string  | null:false |
| first_name         | string  | null:false |
| last_name_kana     | string  | null:false |
| first_name_kana    | string  | null:false |
| birth_year         | integer | null:false |
| birth_month        | integer | null:false |
| birth_day          | integer | null:false |

### Association
- has_many :items
- has_many :comments
- has_many :orders

## items
| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| name        | string    | null:false                     |
| price       | integer   | null:false                     |
| post_date   | date      | null:false                     |
| explanation | text      | null:false                     |
| user_id     | reference | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :users
- has_one :order


## comments
| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| comment  | text      | null:false                     |
| user_id  | reference | null: false, foreign_key: true |
| items_id | reference | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items


## orders
| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| price    | integer   | null:false                     |
| user_id  | reference | null: false, foreign_key: true |
| items_id | reference | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :address


## addresses
| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| postal_code   | integer   | null:false                     |
| prefecture    | string    | null:false                     |
| city          | string    | null:false                     |
| block         | string    | null:false                     |
| building      | text      | null:false                     |
| phone_number  | integer   | null:false                     |
| user_id       | reference | null: false, foreign_key: true |
| items_id      | reference | null: false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to :user
