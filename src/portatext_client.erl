-module(portatext_client).
-author("marcelog@portatext.com").
-github("https://github.com/portatext/erlang-sdk").
-license("Apache-2.0").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exports.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-export([run/5, run/6, run/7]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Public API.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
run(
  Endpoint,
  Method,
  ContentType,
  AcceptContentType,
  Body
) ->
  run(
    Endpoint,
    Method,
    ContentType,
    AcceptContentType,
    Body,
    undefined
  ).

run(
  Endpoint,
  Method,
  ContentType,
  AcceptContentType,
  Body,
  OutputFile
) ->
  run(
    Endpoint,
    Method,
    ContentType,
    AcceptContentType,
    Body,
    undefined,
    undefined
  ).

run(
  Endpoint,
  Method,
  ContentType,
  AcceptContentType,
  Body,
  OutputFile,
  AuthType
) ->
  ok.