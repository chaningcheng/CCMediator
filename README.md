# CCMediator

#### 工程模块化探索

目前项目工程模块化使用的方案为注册路由的方式，这种方案使用是简单的，但是扩展性不强，而且需要实例常驻内存，这在模块化众其实是没有必要的，最重要的是无法满足在 `swift` 项目中使用了，因为 `swift` 项目中没有  `+load` 方法，（ps，虽然可以通过 `plist` 文件来注册路由，但是无法注册模块了，无法注册模块，就没有办法进行解耦调用，这是很大的问题），故而参考使用 `tagert action`方案，结合注册路由的方案，进行工程模块化探索。

### 思路:
* Interface: 协议    
* TargetAction: 协议的实现
* CCMediator: 分发对象消息

### 对比
对比		|target  action  | register route
-----		|------------	    | -------------
swift		| 支持   		    | 不支持
open URL      | 支持	          ｜支持
内存常驻  	| 不需要            ｜ 需要
open 方式 	| 可以定制   	  ｜ 不可以定制
返回参数        | 支持                 | 不支持

### 注意点：
* 关于 `webview` 参考注册路由打开方法，提供了默认的 `interface` 
