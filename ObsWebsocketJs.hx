
typedef ObsWebsocketConnectOptions = {
    var ?address:String;
    var ?password:String;
}

@:jsRequire("obs-websocket-js")
extern class ObsWebsocketJs {
    function new();
    function connect(opt:ObsWebsocketConnectOptions):js.lib.Promise<Any>;
    function on(eventName:String, ?args:Any):js.lib.Promise<Any>;
    function send(requestName:String, ?args:Any):js.lib.Promise<Any>;
}