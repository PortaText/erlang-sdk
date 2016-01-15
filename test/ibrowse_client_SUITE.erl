-module(ibrowse_client_SUITE).

-export([all/0]).
-export([init_per_suite/1, end_per_suite/1]).
-export([
  can_request_with_right_headers_and_body/1
]).

all() ->
  [
    can_request_with_right_headers_and_body
  ].

init_per_suite(Config) ->
  Config.

end_per_suite(_Config) ->
  ok.

can_request_with_right_headers_and_body(_Config) ->
  spawn_link(fun() ->
    ok
  end),
  ok.