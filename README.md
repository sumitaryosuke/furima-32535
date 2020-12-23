# テーブル設計

## users
| Column          | Type   | Options  |
| --------------- | ------ | -------- |
| nickname        | string | NOT NULL |
| email           | string | NOT NULL |
| password        | string | NOT NULL |
| last_name       | string | NOT NULL |
| first_name      | string | NOT NULL |
| last_name_kana  | string | NOT NULL |
| first_name_kana | string | NOT NULL |

### Association
- has_many :items
- has_many :comments


## items
| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| name        | string    | NOT NULL                       |
| explanation | text      | NOT NULL                       |
| user_id     | reference | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :users


## comments
| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| comment  | text      | NOT NULL                       |
| user_id  | reference | null: false, foreign_key: true |
| items_id | reference | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items