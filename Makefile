REBAR?=./rebar3

all: compile xref tests cover coveralls

shell:
	${REBAR} shell

compile:
	${REBAR} compile

tests:
	${REBAR} ct

cover:
	${REBAR} cover

xref:
	${REBAR} xref

coveralls:
	${REBAR} coveralls send
