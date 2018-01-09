створення проекту:

>	rails new rails_api-react_client --api --database=postgresql


перехід в папку:

>	cd /your/app/path


створення моделей:

>	bin/rails g scaffold task title:string description:string priority:integer active:boolean due_date:date user_id:integer


встановлення бандл:

>	bundle install


створення бд:

>	bundle exec rake db:create


міграція бд:

>	bundle exec rake db:migrate


сервер:

>	bundle exec rails server


gemfile:

>	gem 'bcrypt', '~> 3.1.7'		//шифрування

>	gem 'rack-cors'             //ajax


конфиг:

>	config/aplication.rb =>
	  config.middleware.insert_before 0, Rack::Cors do
	    allow do
	      origins '*'
	      resource '*', :headers => :any, :methods => [:get, :post, :options, :patch]
	    end
	  end


?якщо не робить сервер?:

>	echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p


запит:

>	curl -H "Content-Type:application/json; charset=utf-8" -X POST -d '{ "title":"nbnb" }' http://localhost:3000/tasks


новий файл міграції:

>	rails generate model User email:string username:string firstname:string lastname:string


міграція:

>	bundle exec rake db:migrate


відкат міграції:

>	bundle exec rake db:rollback


пісочниця. Any modifications you make will be rolled back on exit:

>	rails console --sandbox


----------------------------------------------------------------------------------------

	КОМАНДИ З БД

----------------------------------------------------------------------------------------


створення user через cmd:

>	User.new

>	=> #<User id: nil, name: nil, email: nil, created_at: nil, updated_at: nil>

>	user = User.new(username: "Michael Hartl", email: "mhartl@example.com")

>	=> #<User id: nil, name: "Michael Hartl", email: "mhartl@example.com", created_at: nil, updated_at: nil>


щоб зберегти зміни з памяті рубі в бд:

>	user.save


для перегляду юзер:

>	user


для перегляду email:

>	user.email


?те заме що і нью разом з сейв?:

>	User.create

>	User.create(name: "A Nother", email: "another@example.org")

> => #<User id: 2, name: "A Nother", email: "another@example.org", created_at: "2013-03-11 01:05:24", updated_at: "2013-03-11 01:05:24">


створює фу(перемінна):

>	foo = User.create(name: "Foo", email: "foo@bar.com")

>	=> #<User id: 3, name: "Foo", email: "foo@bar.com", created_at: "2013-03-11 01:05:42", updated_at: "2013-03-11 01:05:42">


видаляє фуу:

> foo.destroy

>	=> #<User id: 3, name: "Foo", email: "foo@bar.com", created_at: "2013-03-11
	01:05:42", updated_at: "2013-03-11 01:05:42">


пошук по id:

> User.find(3)


пошук по атрибуту:

> User.find_by_email("mhartl@example.com")


перший користувач:

> User.first


всі користувачі:

> User.all


редагування одного з атрибутів:

> user

>	=> #<User id: 1, name: "Michael Hartl", email: "mhartl@example.com",
	created_at: "2013-03-11 00:57:46", updated_at: "2013-03-11 00:57:46">
> user.email = "mhartl@example.net"

>	=> "mhartl@example.net"

> user.save

>	=> true


2 спосіб редагування(всі атрибути):

> user.update_attributes(name: "The Dude", email: "dude@abides.org")

>	=> true

> user.name

>	=> "The Dude"

> user.email

>	=> "dude@abides.org"


2 спосіб редагування(1 атрибут):

>	user.update_attribute(:name, "The Dude")

>	=> true

> user.name

> => "The Dude"


reload оновлює інфо з бд. без сейва воно відкатює зміни:

>	user.email

>	=> "mhartl@example.net"

> user.email = "foo@bar.com"

>	=> "foo@bar.com"

> user.reload.email

> => "mhartl@example.net"


виводить час оновлення та створення:

> user.created_at

>	=> "2013-03-11 00:57:46"

> user.updated_at

>	=> "2013-03-11 01:37:32"


------------------------------------------------------------------------------------------

