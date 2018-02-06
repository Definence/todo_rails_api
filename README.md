------------------------------------------------------------------------------------------

Проект:

>   https://todo-react-client.herokuapp.com/

------------------------------------------------------------------------------------------


  ЗАГАЛЬНІ КОМАНДИ:


------------------------------------------------------------------------------------------

створення проекту:

>		rails new rails_api-react_client --api --database=postgresql


перехід в папку:

>		cd /your/app/path


створення моделей:

>		bin/rails g scaffold task title:string description:string priority:integer active:boolean due_date:date user_id:integer


встановлення бандл:

>		bundle install


створення бд:

>		bundle exec rake db:create


міграція бд:

>		bundle exec rake db:migrate


сервер:

>		bundle exec rails server


gemfile:

>		gem 'bcrypt', '~> 3.1.7'		//шифрування

>		gem 'rack-cors'             //ajax


конфиг:

>	 	config/aplication.rb =>
		  config.middleware.insert_before 0, Rack::Cors do
		    allow do
		      origins '*'
		      resource '*', :headers => :any, :methods => [:get, :post, :options, :patch]
		    end
		  end


?якщо не робить сервер?:

>		echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p


запит:

>		curl -H "Content-Type:application/json; charset=utf-8" -X POST -d '{ "title":"nbnb" }' http://localhost:3000/tasks


новий файл міграції:

>		rails generate model User email:string username:string firstname:string lastname:string


Генерація контролерів user:

> 	bundle exec rails g controller users index new create update


Генерація(addition) надійого насла:

> 	rails generate migration add_password_digest_to_users password_digest:string


Генерація(addition) токен:

> 	rails generate migration add_token_to_users token:string default:false


міграція:

>		bundle exec rake db:migrate:


відкат міграції:

>		bundle exec rake db:rollback:


пісочниця. Any modifications you make will be rolled back on exit:

>		rails console --sandbox

----------------------------------------------------------------------------------------


	КОМАНДИ З БД:


----------------------------------------------------------------------------------------

рейлс консоль:

> 	rails c

>		exit


створення user через cmd:

>		User.new

>		=> #<User id: nil, name: nil, email: nil, created_at: nil, updated_at: nil>

>		user = User.new(username: "Michael Hartl", email: "mhartl@example.com")

>		=> #<User id: nil, name: "Michael Hartl", email: "mhartl@example.com", created_at: nil, updated_at: nil>


щоб зберегти зміни з памяті рубі в бд:

>		user.save


для перегляду юзер:

>		user


для перегляду email:

>		user.email


?те заме що і нью разом з сейв?:

>		User.create

>		User.create(name: "A Nother", email: "another@example.org")

> 	=> #<User id: 2, name: "A Nother", email: "another@example.org", created_at: "2013-03-11 01:05:24", updated_at: "2013-03-11 01:05:24">


створює фу(перемінна):

>		foo = User.create(name: "Foo", email: "foo@bar.com")

>		=> #<User id: 3, name: "Foo", email: "foo@bar.com", created_at: "2013-03-11 01:05:42", updated_at: "2013-03-11 01:05:42">


видаляє фуу:

> 	foo.destroy

>		=> #<User id: 3, name: "Foo", email: "foo@bar.com", created_at: "2013-03-11 01:05:42", updated_at: "2013-03-11 01:05:42">


пошук по id:

> 	User.find(3)


пошук по атрибуту:

> 	User.find_by_email("mhartl@example.com")


перший користувач:

> 	User.first


всі користувачі:

> 	User.all


редагування одного з атрибутів:

> 	user

>		=> #<User id: 1, name: "Michael Hartl", email: "mhartl@example.com", created_at: "2013-03-11 00:57:46", updated_at: "2013-03-11 00:57:46">
> 	user.email = "mhartl@example.net"

>		=> "mhartl@example.net"

> 	user.save

>		=> true


2 спосіб редагування(всі атрибути):

> 	user.update_attributes(name: "The Dude", email: "dude@abides.org")

>		=> true

> 	user.name

>		=> "The Dude"

> 	user.email

>		=> "dude@abides.org"


2 спосіб редагування(1 атрибут):

>		user.update_attribute(:name, "The Dude")

>		=> true

> 	user.name

>	  => "The Dude"


reload оновлює інфо з бд. без сейва воно відкатює зміни:

>		user.email

>		=> "mhartl@example.net"

> 	user.email = "foo@bar.com"

>		=> "foo@bar.com"

> 	user.reload.email

> 	=> "mhartl@example.net"


виводить час оновлення та створення:

> 	user.created_at

>		=> "2013-03-11 00:57:46"

>		user.updated_at

>		=> "2013-03-11 01:37:32"


видалити всіх користувачів:

>		User.destroy_all

------------------------------------------------------------------------------------------


	Rspec(https://github.com/rspec/rspec-rails#rspec-rails--):


------------------------------------------------------------------------------------------

Gemfile:

>		group :development, :test do
>		  gem 'rspec-rails', '~> 3.7'
>		end


>		bundle install


Initialize the spec/ directory:

>		rails generate rspec:install


To run spec:

>		bundle exec rspec

>		bundle exec rspec spec/requests/user_pages_spec.rb

>	  bundle exec rspec spec/requests/

------------------------------------------------------------------------------------------


	Shoulda-matchers (https://github.com/thoughtbot/shoulda-matchers):


------------------------------------------------------------------------------------------

Gemfile:

>		group :test do
>		  gem 'shoulda-matchers', '~> 3.1'
>		end


rails_helper.rb: =>

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec
    with.test_framework :minitest
    with.test_framework :minitest_4
    with.test_framework :test_unit

    # Choose one or more libraries:
    with.library :active_record
    with.library :active_model
    with.library :action_controller
    # Or, choose the following (which implies all of the above):
    with.library :rails
  end
end


Example:

>		RSpec.describe Person, type: :model do
>		  it { should validate_presence_of(:name) }
>		end

------------------------------------------------------------------------------------------


  ВАЛИДАЦИИ:


------------------------------------------------------------------------------------------

/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  полное регулярное выражение
/ начало регулярного выражения
\A  соответствует началу строки
[\w+\-.]+ по крайней мере один символ слова, плюс, дефис или точка
@ буквально “знак собаки”
[a-z\d\-.]+ по крайней мере одна буква, цифра, дефис или точка
\.  буквальная точка
[a-z]+  по крайней мере одна буква
\z  соответствует концу строки
/ конец регулярного выражения
i нечувствительность к регистру
------------------------------------------------------------------------------------------


	Mailer для development(for tests - опціонально):


------------------------------------------------------------------------------------------

config.action_mailer.delivery_method = :letter_opener

config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }


group :development do

 gem 'letter_opener'

end

------------------------------------------------------------------------------------------


	UserSerializer(Serializer):


------------------------------------------------------------------------------------------

Використовують для того, щоб вказати які саме дані відправляти, а не відправляти всі і

зменшити навантаження на api. Використовується, коли треба щось вивести на ФЕ.


gems:

>		gem 'active_model_serializers'


next:

>		mkdir app/serializers

> 	user_serializer.rb

>		class UserSerializer < ActiveModel::Serializer
>  		 attributes :username, :token
> 		 # attributes :id, :email, :username, :firstname, :lastname, :token
>		end

for using(can be each_serializer!):

>		render json: user, serializer: UserSerializer, status: :created

or

>		render_api(user, :created, serializer: UserSerializer)

------------------------------------------------------------------------------------------


	Expose:


------------------------------------------------------------------------------------------

Gem:

>		gem 'decent_exposure'


Expose(щось схоже на функцію):

>		expose :tasks, -> { current_user.tasks.all }

------------------------------------------------------------------------------------------