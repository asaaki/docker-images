FROM asaaki/base-dev:0.1.1
MAINTAINER Christoph Grabo <asaaki@mannaz.cc>

RUN apk --update add \
    erlang erlang-asn1 erlang-common-test erlang-compiler erlang-cosevent \
    erlang-coseventdomain erlang-cosfiletransfer erlang-cosnotification \
    erlang-cosproperty erlang-costime erlang-costransaction erlang-crypto \
    erlang-debugger erlang-dev erlang-dialyzer erlang-diameter erlang-edoc \
    erlang-eldap erlang-erl-docgen erlang-erl-interface erlang-erts erlang-et \
    erlang-eunit erlang-gs erlang-hipe erlang-ic erlang-inets erlang-jinterface \
    erlang-kernel erlang-megaco erlang-mnesia erlang-observer erlang-odbc \
    erlang-orber erlang-os-mon erlang-ose erlang-otp-mibs erlang-parsetools \
    erlang-percept erlang-public-key erlang-reltool erlang-runtime-tools \
    erlang-sasl erlang-snmp erlang-ssh erlang-ssl erlang-stdlib \
    erlang-syntax-tools erlang-test-server erlang-tools erlang-typer \
    erlang-webtool erlang-xmerl && \
    rm -rf /var/cache/apk/*

RUN wget https://s3.amazonaws.com/rebar3/rebar3 -O /usr/local/bin/rebar3 && \
    chmod +x /usr/local/bin/rebar3 && \
    mkdir -p $HOME/.config/rebar3/ && \
    echo '{plugins, [rebar3_hex]}.' > $HOME/.config/rebar3/rebar.config && \
    rebar3 update && rebar3 plugins upgrade rebar3_hex
