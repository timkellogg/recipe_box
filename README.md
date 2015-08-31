#	Recipe Box 

##### _Bringing You the Best Foods Since August 27, 2015_

#### By **Tim Kellogg and Alisa Colon**

## Description

_Recipe box is an applicatio that allows you to make recipes._

##	Setup

* `git clone` this file
* `cd` into the root of the app
* `rake db:setup` to create db and run migrations
* `ruby app.rb` to start the server
* `rake db:test:prepare` to build test db
* `rspec` to test both integration and libraries

###	Technologies Used

* Language: Ruby
* Stack: Ruby/Sinatra
* Database: Postgresql 
* ORM: ActiveRecord/Rake
* Middleware: Rack
* Testing: Rspec/Capybara/Pry
* Server: Puma
* Other Dependencies: listed in Gemfile.lock
* Front-End: ZURB Foundation/jQuery 

###	Legal

Copyright (c) 2015 **_Tim Kellogg_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
