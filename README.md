# The Pizza Shop

This projects implements the administration and orders of the Pizza Shop as a REST service. Development with Ruby on Rails Framework

## Architecture

The following patters are used in this project:

* **MVC** - *Model View Controller* - This architecture separates out the application logic into three separate parts, promoting modularity and ease of collaboration and reuse. It also makes applications more flexible and welcoming to iterations.
* **REST** - *REpresentational State Transfer* -  Is an architectural style for developing web services. Rest web services provides the ability to access representations of web resources using http requests. You can request data, or execute operations over some data.

The project uses JSON for communication.
For data storage this projects uses Ruby on Rails default database (SQLite).

Additional the next diagrams represent part of the class model design.

Class diagram: https://drive.google.com/open?id=1J1kVwjdkbhH9Grerr_hTYIXIwL2_UBpu

## Testing
The followings gem where used to write all the tests:

```
gem 'rspec-rails', '~> 3.8'
gem 'faker
gem 'factory_bot_rails', '~> 4.0'
gem 'shoulda-matchers', '~> 3.1'
gem 'database_cleaner'
```
To run all the test run the following command:
```
bundle exec rspec
```
## Migration and Seeding
To run the seed.rb file, run the following command:
```
rake db:migrate db:seed
```
## Important considerations

This project was developed with Ruby on Rails Framework version '5.2.1' and with ruby version '2.4.1'
