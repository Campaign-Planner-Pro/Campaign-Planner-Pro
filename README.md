<div align="center">
    <img src="https://github.com/Campaign-Planner-Pro/Campaign-Planner-Pro/assets/127896538/94cf7315-fde5-449f-ba7e-d5f69c6c204c" alt="Campaign">
</div>

![GitHub issues](https://img.shields.io/github/issues/Campaign-Planner-Pro/Campaign-Planner-Pro.svg)
![GitHub issues clsoed](https://img.shields.io/github/issues-closed/Campaign-Planner-Pro/Campaign-Planner-Pro.svg
)
![pull request](https://img.shields.io/github/issues-pr/Campaign-Planner-Pro/Campaign-Planner-Pro.svg)
![pull request closed](https://img.shields.io/github/issues-pr-closed/Campaign-Planner-Pro/Campaign-Planner-Pro.svg)
[![website down](https://img.shields.io/badge/website-down-red)](http://campaignplanner.pro)
<!-- [![website down](https://img.shields.io/website-up-down-green-red/http/monip.org.svg)](http://campaignplanner.pro) -->

![Made with Ruby on Rails](https://img.shields.io/badge/Made%20with-Ruby%20on%20Rails-%23990000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Made with Ruby](https://img.shields.io/badge/Made%20with-Ruby-%23990000?style=for-the-badge&logo=ruby&logoColor=white)


Technologies used:<br>
<div>
  <img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white"/>
  <img src="https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white"/>
  <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"/>
  <img src="https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white"/>
  <img src="https://img.shields.io/badge/circleci-343434?style=for-the-badge&logo=circleci&logoColor=white"/>
  <img src="https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white" />
  <img src="https://img.shields.io/badge/HTML-239120?style=for-the-badge&logo=html5&logoColor=white" />
  <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white" />
  <img src="https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white" />
  <img src="https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white" />
  <img src="https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E" />
</div>

---

</div>

<p> Campaign Planner Pro is a Ruby on Rails monolith application designed as a digital playbook for Dungeons and Dragons players. It enables users to easily organize and track their campaign settings, characters, and more, all in one place. Leveraging the features of Rails 7, this tool provides an enjoyable and easygoing experience, making game organization a breeze.
</p>

<details>
<summary>The Team Behind Campaign Planner Pro</summary>

### 
- Trevor Robinson [![GitHub](https://img.shields.io/badge/-GitHub-grey?style=flat&logo=github&logoColor=white)](https://github.com/Trevor-Robinson) [![LinkedIn](https://img.shields.io/badge/-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/trevor-robinson1254/)<br><br>
- Gabe Torres [![GitHub](https://img.shields.io/badge/-GitHub-grey?style=flat&logo=github&logoColor=white)](https://github.com/Gabe-Torres) [![LinkedIn](https://img.shields.io/badge/-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/gabe-torres-74a515269/)<br><br>
- Maria Torres [![GitHub](https://img.shields.io/badge/-GitHub-grey?style=flat&logo=github&logoColor=white)](https://github.com/tmaria17) [![LinkedIn](https://img.shields.io/badge/-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/mariavictoriatorres/)<br><br>
</details>


--- 

## Summary 
- [Important Links](#important-links)
- [Getting Started](#getting-started)
- [Routes](#routes)
- [Test Suite](#test-suite)
- [Reflection](#reflection)


## Important Links
- [Back-End production site](https://campaign-planner-pro-825f9d3df879.herokuapp.com/users/sign_in)


## Getting Started
<details>
<summary>Database Information</summary>

**Schema**

```ruby
create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "nonplayer_characters", force: :cascade do |t|
    t.string "name"
    t.string "background"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_nonplayer_characters_on_campaign_id"
  end

  create_table "player_characters", force: :cascade do |t|
    t.string "name"
    t.string "background"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_player_characters_on_campaign_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigns", "users"
  add_foreign_key "nonplayer_characters", "campaigns"
  add_foreign_key "player_characters", "campaigns"
end
```

**Gems**
```ruby
gem "rails", "~> 7.0.8"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "tailwindcss-rails"
gem "stimulus-rails" 
gem "jbuilder"
gem 'hotwire-rails'
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'pry'
  gem 'active_designer'
  gem 'factory_bot'
  gem 'simplecov', require: false, group: :test
end

group :development do
  gem "web-console"
end

gem "devise", "~> 4.9"
```

**Installing**
 - Fork and clone this repo
  - Run `bundle install`
  - Run `rails db:{create,migrate,seed}`
  - Run `rails s` to start the server
  - Open your browser and navigate to `localhost:3000`
</details>

## Routes

| Action | Route |
| ----------- | ----------- |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |


## Test Suite
 - run `bundle exec rspec` to run the test suite

<details>
<summary>Happy Path</summary>
    
```ruby
```

</details>

<details>
<summary>Sad Path</summary>

```ruby
```

</details>

