# Overview

The Julia Webstack is a family of modules for building web services in the [Julia language][julia].  The documentation provided here is generally in order of highest to lowest level.

 * [Morsel][Morsel] - a sinatra-like routable web framework.
 * [Meddle][Meddle] - a rack-like request middleware stack.
 * [WebSockets][WebSockets] - an implementation of the `websockets` protocol.
 * [HttpServer][HttpServer] - a basic http service over `TCP`.
 * [HttpParser][HttpParser] - a wrapper for Joyent's [http-parser][http-parser] lib.
 * [HttpCommon][HttpCommon] - shared Types and utilities

[julia]: http://julialang.org
[http-parser]: https://github.com/joyent/http-parser
[Morsel]: https://github.com/JuliaWeb/Morsel.jl
[Meddle]: https://github.com/JuliaWeb/Meddle.jl
[WebSockets]: https://github.com/JuliaWeb/WebSockets.jl
[HttpServer]: https://github.com/JuliaWeb/HttpServer.jl
[HttpParser]: https://github.com/JuliaWeb/HttpParser.jl
[HttpCommon]: https://github.com/JuliaWeb/HttpCommon.jl
