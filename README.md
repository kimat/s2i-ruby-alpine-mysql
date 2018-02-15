# ruby-alpine s2i-base-image

## Usage
```
make build

s2i build . s2i-ruby-alpine-mysql bla
s2i build --rm --incremental=true --env=RAILS_ENV=test . s2i-ruby-alpine-mysql bla
```

