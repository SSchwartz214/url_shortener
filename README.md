### Url Shortener

#### Description

Url Shortner is the backend of an app that allows users to input a url and have it shortened to a custom url.  Users can also visit the original url by clicking on the shortened url as well as view the top 100 most viewed urls.

#### Rails version: 5.1.6

### Configuration

* Clone the repository:
```
git clone https://github.com/SSchwartz214/url_shortener.git
```

* Setup:
```
$ bundle install
$ bundle update
$ rake db:{create,migrate,seed}
```

* To view locally:
```
$ redis-server
$ bundle exec sidekiq
$ rails s

Then visit 'localhost:3000' in your browser
```
* How to run the test suite
```
$ rspec
```

* To view production version, visit:
```
https://tranquil-anchorage-97299.herokuapp.com/
```

### Record Endpoints:

#### Urls
```
POST /api/v1/url
```
   * Allows creating a new url with parameters:<br/>
        example parameters:<br/>
            { "original": "https://www.google.com/" } <br/>
            
        Return JSON:<br/>
        {<br/>
          "original": "https://www.google.com/",<br/>
          "short": "m",<br/>
          "title": null<br/>
         }
```
GET /api/v1/<shortened url>
```
  * Redirects to the original url
```
GET /api/v1/top
```
  * Returns the top 100 most frequented urls

#### Questions or comments?

Please contact me at:

* Seth: sschwartz214@gmail.com
