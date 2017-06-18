# Makuake

## Overview
### App-name: makuake
### App-aim:  replicate makuake by eye, and brush-up my skills


## Minimum Requirement features
### 1. プロジェクト管理機能(CRUD)
### 2. プロダクト管理機能(CRUD)
### 3. ユーザー管理機能(CRUD)
### 4. カテゴリ管理機能

## Maximum Requirement features
### 1. コンテンツ管理機能(CRUD)
### 2. ブログ管理機能(CRUD)
### 3. SNS連携機能
### 4. 検索機能
### 5. 活動レポート(CRUD)機能  構造：プロジェクトにひも付き
### 6. 応援コメント(CRUD)     構造：プロジェクトにひも付き
### 7. ストア化機能           構造：プロジェクト/カテゴリにひも付き
### 8. お気に入り登録機能      構造：ユーザーにひも付き
### 9. プロジェクト支援機能    構造：ユーザーにひも付き


## DB structure

### Entity
#### 1.  Project
#### 2.  Product
#### 3.  Category
#### 3.5 Category_Project
#### 4.  User
#### 4.5 Project_User
#### 4.5 Product_User
 * on assumption that project categories = product categories

### Tables
  ### 1. Project
    #### belongs_to :none
    #### has_many :products
    #### has_many :categories, through: category_project
    #### has_many :users, through: project_user
   | Column                 | Type        | Settings        | Reference       |
   |:--|:--|:--|:--|
   | pjt_name               |        text |         not null|                 |
   | pjt_image              |      string |                 |                 |
   | pjt_description        |        text |                 |                 |
   | money_collected        |        text |                 |                 |
   | money_target           |        text |         not null|                 |
   | deadline               |        date |         not null|                 |
   | admin id               |     integer |         not null|                 |
   | category_project id    |     integer |                 |  ref:foreign_key|
   | project_user id        |     integer |                 |  ref:foreign_key|

  ### 2. Product
    #### belongs_to :project
    #### has_many :users, through: product_user
   | Column                 | Type        | Settings        | Reference       |
   |:--|:--|:--|:--|
   | pdt_name               |        text |         not null|                 |
   | pdt_image              |      string |                 |                 |
   | pdt_description        |        text |                 |                 |
   | price                  |        text |         not null|                 |
   | stock                  |     integer |         not null|                 |
   | delivery_date          |        date |                 |                 |
   | admin id               |     integer |         not null|                 |
   | category_project id    |     integer |                 |  ref:foreign_key|
   | product_user id        |     integer |                 |  ref:foreign_key|

  ### 3. Category
    #### belongs_to :none
    #### has_many :projects, through: category_project
   | Column                 | Type        | Settings        | Reference       |
   |:--|:--|:--|:--|
   | category_name          |        text |         not null|                 |
   | category_project id    |     integer |                 |  ref:foreign_key|

  ### 3.5. Category_Project
    #### belongs_to :project
    #### belongs_to :category
    #### has_many :none
   | Column                 | Type        | Settings        | Reference       |
   |:--|:--|:--|:--|
   | project_id             |     integer |                 |  ref:foreign_key|
   | category_id            |     integer |                 |  ref:foreign_key|

  ### 4. User (* Via use of "devise" gem)
    #### belongs_to :none
    #### has_many :projects, through: project_user
    #### has_many :products, through: product_user
   | Column                 | Type        | Settings        | Reference       |
   |:--|:--|:--|:--|
   | user_name              |        text |         not null|                 |
   | user_image             |      string |                 |                 |
   | user_description       |        text |                 |                 |
   | e-mail                 |        text |         not null|                 |
   | password               |        text |         not null|                 |
   | project_user id        |     integer |                 |  ref:foreign_key|
   | product_user id        |     integer |                 |  ref:foreign_key|

  ### 4.5. Project_user
    #### belongs_to :project
    #### belongs_to :user
    #### has_many :none
   | Column                 | Type        | Settings        | Reference       |
   |:--|:--|:--|:--|
   | project_id             |     integer |                 |  ref:foreign_key|
   | user_id                |     integer |                 |  ref:foreign_key|

  ### 4.5. Product_user
    #### belongs_to :product
    #### belongs_to :user
    #### has_many :none
   | Column                 | Type        | Settings        | Reference       |
   |:--|:--|:--|:--|
   | product_id             |     integer |                 |  ref:foreign_key|
   | user_id                |     integer |                 |  ref:foreign_key|
