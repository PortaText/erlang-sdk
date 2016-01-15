-module(portatext_client).
-author("marcelog@portatext.com").
-github("https://github.com/portatext/erlang-sdk").
-license("Apache-2.0").
-behavior(gen_server).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Include files.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-include("portatext.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exports.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-export([start_link/1, start_link/2]).
-export([start/1, start/2]).
-export([run/6, run/7, run/8]).
-export([
  init/1,
  handle_call/3,
  handle_info/2,
  handle_cast/2,
  code_change/3,
  terminate/2
]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Public API.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start_link(ApiKey) ->
  gen_server:start_link(?MODULE, [ApiKey, undefined, undefined], []).

start_link(Username, Password) ->
  gen_server:start_link(?MODULE, [undefined, Username, Password], []).

start(ApiKey) ->
  gen_server:start(?MODULE, [ApiKey, undefined, undefined], []).

start(Username, Password) ->
  gen_server:start(?MODULE, [undefined, Username, Password], []).

run(Client, Endpoint, Method, CType, ACType, Body) ->
  run(Client, Endpoint, Method, CType, ACType, Body, undefined).

run(Client, Endpoint, Method, CType, ACType, Body, OutputFile) ->
  run(Client, Endpoint, Method, CType, ACType, Body, undefined, undefined).

run(Client, Endpoint, Method, CType, ACType, Body, OutputFile, AuthType) ->
  gen_server:call(
    Client, {run, Endpoint, Method, CType, ACType, Body, OutputFile, AuthType}
  ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% gen_server API.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
init([ApiKey, Username, Password]) ->
  State = [
    {api_key, ApiKey},
    {username, Username},
    {password, Password}
  ],
  {ok, State}.

handle_call(
  {Endpoint, Method, CType, ACType, Body, OutputFile, AuthType}, _From, State
) ->
  ImplModule = ?CFG:request_backend(),
  Headers = [
    {"Content-Type", CType},
    {"Accept", ACType}
  ],
  Url = ?CFG:base_url() ++ "/" ++ Endpoint,
  {RetCode, RetHeaders, RetBody} = erlang:apply(
    ImplModule, execute, [Url, Headers, Method, Body]
  ),
  {reply, ok, State};

handle_call(_Request, _From, State) ->
  {reply, not_implemented, State}.

handle_cast(_Request, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

terminate(_Reason, _State) ->
  ok.

