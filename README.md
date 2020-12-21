##### How to install
You need to use Ruby 2.7.2 installed on you system. If you need to install Ruby see [rbenv](https://github.com/rbenv/rbenv) to install it.

Installation:
```sh
gem install bundler
bundle install
bundle exec rails db:schema:load
```


### API
#### List events
Endpoint: GET `/events.json`
Parameter: None
Output:
```
[
   {
      "id":"uid4",
      "name":"name4",
      "uid":"uid4",
      "location":"location4",
      "start_datetime":"2020-12-21T11:25:53.489Z",
      "end_datetime":"2020-12-21T12:25:53.489Z",
      "url":"http://www.example.com/events/uid4.json"
   }
]
```
