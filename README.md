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

https://url-shortener--api.herokuapp.com/api/v1/top

## Record Endpoints:

### Urls

#### POST /api/v1/url

   * Allows creating a new url with parameters:
```
        example parameters:

            { "original": "https://www.google.com/" }
```
```    
        Return JSON:
        
            {
              "original": "https://www.google.com/",
              "short": "m",
              "title": null
             }
```

#### GET /api/v1/<short>

   * Redirects to the original url


#### GET /api/v1/top

   * Returns the top 100 most frequented urls
```

      [
        {
            "original": "https://www.mlb.com/",
            "short": "i",
            "title": "MLB.com | The Official Site of Major League Baseball"
        },
        {
            "original": "https://www.google.com/",
            "short": "j",
            "title": "Google"
        },
        {
            "original": "https://www.twitter.com/",
            "short": "1",
            "title": "Twitter. It's what's happening."
        },
```

#### Questions or comments?

Please contact me at:

* Seth: sschwartz214@gmail.com
