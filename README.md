### Url Shortener

#### Description

Url Shortner is the backend of an app that allows users to input a url and have it shortened to a custom url.  Users can also visit the original url by clicking on the shortened url as well as view the top 100 most viewed urls.

### Algorithm 
My method "generate_short" takes the database id for a url and converts it into it’s Base 36 equivalent.  Since every url has a unique id no url will ever have the same Base 36 equivalent and as a result will never have the same shortened url.

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

https://tranquil-anchorage-97299.herokuapp.com/

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
GET /api/v1/<short>
```
  * Redirects to the original url
```
GET /api/v1/top
```
  * Returns the top 100 most frequented urls
  
  Return JSON:<br/>
  [<br/>
    {<br/>
        "original": "https://www.mlb.com/",<br/>
        "short": "i",<br/>
        "title": "MLB.com | The Official Site of Major League Baseball"<br/>
    },<br/>
    {<br/>
        "original": "https://www.google.com/",<br/>
        "short": "j",<br/>
        "title": "Google"<br/>
    },<br/>
    {<br/>
        "original": "https://www.twitter.com/",<br/>
        "short": "1",<br/>
        "title": "Twitter. It's what's happening."<br/>
    },

#### Questions or comments?

Please contact me at:

* Seth: sschwartz214@gmail.com
