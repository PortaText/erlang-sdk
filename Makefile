REBAR?=./rebar3

all: compile tests cover

compile:
	${REBAR} compile

tests:
	${REBAR} ct

cover:
	${REBAR} cover
