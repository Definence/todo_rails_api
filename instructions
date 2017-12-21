rails new rails_api-react_client --api --database=postgresql
cd /your/app/path
bin/rails g scaffold task title:string description:string priority:integer active:boolean due_date:date user_id:integer
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rails server

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
?												//якщо не робить сервер

	//запрос
curl -H "Content-Type:application/json; charset=utf-8" -X POST -d '{ "title":"nbnb" }' http://localhost:3000/tasks

