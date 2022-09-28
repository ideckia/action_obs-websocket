package;

using api.IdeckiaApi;

typedef Props = {
	@:shared
	@:editable("Obs address", "localhost:4444")
	var address:String;
	@:shared
	@:editable("Obs password")
	var password:String;
	@:editable("Obs request name")
	var request_name:String;
	@:editable("Obs request arguments")
	var request_arguments:Any;
}

@:name('obs-websocket')
@:description('Control OBS via websockets. A wrapper for obs-websocket-js')
class ObsWebsocket extends IdeckiaAction {
	static var obs:ObsWebsocketJs;

	override public function init(initialState:ItemState):js.lib.Promise<ItemState> {
		return new js.lib.Promise((resolve, reject) -> {
			if (obs != null) {
				server.log.debug("OBS already connected.");
				resolve(initialState);
				return;
			}

			obs = new ObsWebsocketJs();
			obs.connect({
				address: props.address,
				password: props.password
			}).then((_) -> {
				server.log.info("Success! We're connected & authenticated.");
			}).catchError((error) -> {
				obs = null;
				reject('Error connecting to OBS: $error');
			});
			resolve(initialState);
		});
	}

	public function execute(currentState:ItemState):js.lib.Promise<ItemState> {
		return new js.lib.Promise((resolve, reject) -> {
			if (props.request_name == null)
				reject('The request_name can not be null');

			server.log.debug('Sending request [name=${props.request_name}, args=${props.request_arguments}]');
			obs.send(props.request_name, props.request_arguments).then(data -> {
				server.log.debug('Received data: $data.');
			}).catchError((error) -> {
				reject('Error: $error');
			});

			resolve(currentState);
		});
	}
}
