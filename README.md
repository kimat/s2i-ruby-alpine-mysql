# ruby-alpine s2i-base-image

## Usage
```
make build
make publish

s2i build . kimat/s2i-ruby-alpine-mysql bla
s2i build --rm --incremental=true --env=RAILS_ENV=test . kimat/s2i-ruby-alpine-mysql bla
```

