"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[670],{2149:e=>{e.exports=JSON.parse('{"functions":[{"name":"getUserInfo","desc":"Gets some user info from the users list.\\r","params":[],"returns":[{"desc":"","lua_type":"UserInfo"}],"function_type":"static","source":{"line":52,"path":"src/init.luau"}},{"name":"getUserId","desc":"Gets some user id from the users list.\\r","params":[],"returns":[{"desc":"","lua_type":"number"}],"function_type":"static","source":{"line":59,"path":"src/init.luau"}},{"name":"getUsername","desc":"Gets some username from the users list.\\r","params":[],"returns":[{"desc":"","lua_type":"string"}],"function_type":"static","source":{"line":65,"path":"src/init.luau"}},{"name":"getDisplayName","desc":"Gets some display name from the users list.\\r","params":[],"returns":[{"desc":"","lua_type":"string"}],"function_type":"static","source":{"line":71,"path":"src/init.luau"}},{"name":"getUserThumbnail","desc":"Gets some user thumbnail from the users list.\\r","params":[{"name":"thumbnailType","desc":"","lua_type":"Enum.ThumbnailType"},{"name":"thumbnailSize","desc":"","lua_type":"Enum.ThumbnailSize"}],"returns":[{"desc":"","lua_type":"string"}],"function_type":"static","source":{"line":79,"path":"src/init.luau"}},{"name":"createMockPlayer","desc":"Creates a mock player.\\r","params":[],"returns":[{"desc":"","lua_type":"MockPlayer"}],"function_type":"static","source":{"line":86,"path":"src/init.luau"}},{"name":"createList","desc":"Creates an array of length `count` filled with the return value of `fn`. (`fn` is called each iteration)\\r","params":[{"name":"fn","desc":"","lua_type":"() -> TReturn"},{"name":"count","desc":"","lua_type":"number"}],"returns":[{"desc":"","lua_type":"{ TReturn }"}],"function_type":"static","source":{"line":97,"path":"src/init.luau"}},{"name":"createUniqueList","desc":"Creates an array of length `count` filled with the return of `fn`. (`fn` is called each iteration, and the table cannot contain duplicate values)\\r","params":[{"name":"fn","desc":"","lua_type":"() -> TReturn"},{"name":"count","desc":"","lua_type":"number"}],"returns":[{"desc":"","lua_type":"{ TReturn }"}],"function_type":"static","source":{"line":107,"path":"src/init.luau"}}],"properties":[],"types":[{"name":"UserInfo","desc":"","fields":[{"name":"description","lua_type":"string","desc":""},{"name":"created","lua_type":"string","desc":""},{"name":"isBanned","lua_type":"boolean","desc":""},{"name":"externalAppDisplayName?","lua_type":"string","desc":""},{"name":"hasVerifiedBadge","lua_type":"boolean","desc":""},{"name":"id","lua_type":"number","desc":""},{"name":"name","lua_type":"string","desc":""},{"name":"displayName","lua_type":"string","desc":""}],"source":{"line":14,"path":"src/init.luau"}},{"name":"MockPlayer","desc":"","fields":[{"name":"UserId","lua_type":"number","desc":""},{"name":"Name","lua_type":"string","desc":""},{"name":"DisplayName","lua_type":"string","desc":""}],"source":{"line":30,"path":"src/init.luau"}}],"name":"Faker","desc":"","source":{"line":48,"path":"src/init.luau"}}')}}]);