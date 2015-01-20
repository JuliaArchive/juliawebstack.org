# Overview

The Julia Webstack is a family of modules for building web services in the [Julia language][julia].  The documentation provided here is generally in order of highest to lowest level.

 * <a class="section-link" href="#Morsel">Morsel</a> ([github][Morsel]) - a sinatra-like routable web framework.
 * <a class="section-link" href="#Meddle">Meddle</a> a rack-like request middleware stack.
 * <a class="section-link" href="#WebSockets">WebSockets</a> an implementation of the `websockets` protocol.
 * <a class="section-link" href="#HttpServer">HttpServer</a> basic http service over `TCP`.
 * <a class="section-link" href="#HttpParser">HttpParser</a> a wrapper for Joyent's [http-parser][http-parser] lib.
 * <a class="section-link" href="#HttpCommon">HttpCommon</a> shared Types and utilities

[julia]: http://julialang.org
[http-parser]: https://github.com/joyent/http-parser
[Morsel]: https://github.com/JuliaWeb/Morsel.jl
