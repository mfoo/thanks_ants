[![Build Status](https://travis-ci.org/mfoo/thanks_ants.svg?branch=master)](https://travis-ci.org/mfoo/thanks_ants)

# Thanks ants, thants

This project is a basic and minimal Rails 4 API to convert inputs like "thanks ants" to "thants", a joke from the comedy television show [Look Around You](https://en.wikipedia.org/wiki/Look_Around_You).

As an example, see [this clip on YouTube](https://www.youtube.com/watch?v=9jtU9BbReQk).

## API Routes

This app exposes the following routes:

* **thanks/:thankee**
	* /thanks/ants => ants
	* /thanks/bob => thob
* **blessyou/:blessee**
	* /blessyou/ants => blants
	* /blessyou/bob => blob
* **/thing/:thing/:thingee** (for arbitrary calls, no JSON response yet)
	* /thing/hello/nick => hick

The API is accessible through JSON based on the `Content-Type` and `Accepts` header.

JSON responses are in the format:

```
/thanks/ants.json   => { "thanks": "thants" }
/blessyou/ants.json => { "blessyou": "blants" }
```

## Getting Started

### Rails application
You should simply be able to run `bundle install` and then `rails s` inside the `thanks_ants` subfolder. This Rails application has no models and requires no database connection. The application code is almost entirely contained within two modules; `ThanksHelper` and `BlessYouHelper`.

### Docker service
If you want to try the project out on Docker, the root of the project contains a `Dockerfile` and some configuration files. The Docker container configures a puma master to run multiple Rails workers and it exposes port 3000.
