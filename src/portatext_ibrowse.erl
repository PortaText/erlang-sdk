-module(portatext_ibrowse).
-author("marcelog@portatext.com").
-github("https://github.com/portatext/erlang-sdk").
-license("Apache-2.0").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Include files.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-include("portatext.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exports.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-export([execute/4]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Public API.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
execute(Url, Headers, Method, Body) ->
  IOptions = [
    {response_format, binary}
    |?CFG:ibrowse_options()
  ],
  {ok, RetCode, RetHeaders, RetBody} = ibrowse:send_req(
    Url,
    Headers,
    Method,
    Body,
    IOptions
  ),
  NormRetCode = list_to_integer(RetCode),
  NormRetHeaders = lists:map(fun({K, V}) ->
    {list_to_binary(string:to_lower(K)), V}
  end, RetHeaders),
  NormRetBody = RetBody,
  {NormRetCode, NormRetHeaders, NormRetBody}.
