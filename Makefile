REBAR?=./rebar3

all: compile edoc xref tests cover coveralls

clean:
	${REBAR} clean

shell:
	${REBAR} shell

compile:
	${REBAR} compile

tests:
	${REBAR} ct skip_deps=true

cover:
	${REBAR} cover

xref:
	${REBAR} xref skip_deps=true

coveralls:
	${REBAR} coveralls send

edoc:
	${REBAR} edoc skip_deps=true
	${REBAR} doc skip_deps=true
