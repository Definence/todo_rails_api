rails new rails_api-react_client --api --database=postgresql

cd /your/app/path

bin/rails g scaffold task title:string description:string priority:integer active:boolean due_date:date user_id:integer

bundle install

bundle exec rake db:create

bundle exec rake db:migrate

bundle exec rails server

gemfile:
gem 'bcrypt', '~> 3.1.7'		//шифрування
gem 'rack-cors'             //ajax

config/aplication.rb =>
  config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'
      resource '*', :headers => :any, :methods => [:get, :post, :options, :patch]
    end
  end

?echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
?			-		 якщо не робить сервер

curl -H "Content-Type:application/json; charset=utf-8" -X POST -d '{ "title":"nbnb" }' http://localhost:3000/tasks 		-		 запит

rails generate model User email:string username:string firstname:string lastname:string   -   новий файл міграції

bundle exec rake db:migrate   -   міграція

bundle exec rake db:rollback   -   відкат міграції

>>rails console --sandbox   -   пісочниця. Any modifications you make will be rolled back on exit

--------------------------------------------------------------------------------------

команди з бд

----------------------------------------------------------------------------------------

>> User.new   -   створення user через cmd
=> #<User id: nil, name: nil, email: nil, created_at: nil, updated_at: nil>

>> user = User.new(username: "Michael Hartl", email: "mhartl@example.com")
=> #<User id: nil, name: "Michael Hartl", email: "mhartl@example.com",
created_at: nil, updated_at: nil>

user.save   -   щоб зберегти зміни з памяті рубі в бд

user		-			для перегляду юзер

user.email

User.create 		-			?те заме що і нью разом з сейв?

>> User.create(name: "A Nother", email: "another@example.org")
#<User id: 2, name: "A Nother", email: "another@example.org", created_at:
"2013-03-11 01:05:24", updated_at: "2013-03-11 01:05:24">

>> foo = User.create(name: "Foo", email: "foo@bar.com") 			-			створює фу
#<User id: 3, name: "Foo", email: "foo@bar.com", created_at: "2013-03-11
01:05:42", updated_at: "2013-03-11 01:05:42">

foo.destroy 			-			видаляє фуу
=> #<User id: 3, name: "Foo", email: "foo@bar.com", created_at: "2013-03-11
01:05:42", updated_at: "2013-03-11 01:05:42">

User.find(3) 			-			пошук по id

User.find_by_email("mhartl@example.com") 			-			пошук по атрибуту

User.first 			-			перший користувач

User.all 			-			всі користувачі

//редагування одного з атрибутів
>> user           # Просто напоминание о наших атрибутах пользователя
=> #<User id: 1, name: "Michael Hartl", email: "mhartl@example.com",
created_at: "2013-03-11 00:57:46", updated_at: "2013-03-11 00:57:46">
>> user.email = "mhartl@example.net"
=> "mhartl@example.net"
>> user.save
=> true

//2 спосіб редагування
>> user.update_attributes(name: "The Dude", email: "dude@abides.org")
=> true
>> user.name
=> "The Dude"
>> user.email
=> "dude@abides.org"

//2 спосіб редагування(1 атрибут)
>> user.update_attribute(:name, "The Dude")
=> true
>> user.name
=> "The Dude"

//reload оновлює інфо з бд. без сейва воно відкатює зміни
>> user.email
=> "mhartl@example.net"
>> user.email = "foo@bar.com"
=> "foo@bar.com"
>> user.reload.email
=> "mhartl@example.net"

//виводить час оновлення та створення
>> user.created_at
=> "2013-03-11 00:57:46"
>> user.updated_at
=> "2013-03-11 01:37:32"

------------------------------------------------------------------------------------------

