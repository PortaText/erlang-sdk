-module(portatext_client).

-export([run/5, run/6, run/7]).

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