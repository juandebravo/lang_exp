This is a basic proof of concept developed in october 2011 taking part of the [*I* *Language* *Experiment*](https://twitter.com/#!/search/%23languageexperiment).

Don't use it in production :-)

# Basic social network demo

* Install [Ruby version manager (rvm)](http://rvm.beginrescueend.com)

* Install ruby MRI 1.9.2p290

    rvm install 1.9.2  
    rvm use 1.9.2 --default
    
* Create a project specific gemset 

    rvm gemset create lang_exp

    rvm gemset use lang_exp
  
* Install mongodb

* Clone git repository

    git clone git@github.com:juandebravo/lang_exp.git

* Go to language experiment directory:

    cd lang\_exp
  
* Install dependencies

    gem install bundler # install dependency manager
    
    bundle install # install lang\_exp dependencies
  
* Start application.

    bundle exec rails s
  
By default, application will run on port 3000 using mongodb database lang\_exp\_development. 
You can start in a different port using the switch **-p**, and a different database updating the config file **config/mongoid.yml**.

# License

  The MIT License

  Copyright (c) 2011 Juan de Bravo, Roberto Pérez

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  'Software'), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.