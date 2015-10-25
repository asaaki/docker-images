FROM asaaki/base-erlang:18.0
MAINTAINER Christoph Grabo <asaaki@mannaz.cc>

RUN apk --update add 'elixir<1.1' && rm -rf /var/cache/apk/*

RUN mix local.hex --force && mix local.rebar --force
