package;

using api.IdeckiaApi;

typedef Props = {
	@:editable("Obs address", "localhost:4444")
	var address:String;
	@:editable("Obs password")
	var password:String;
	@:editable("Obs request name")
	var requestName:String;
	@:editable("Obs request arguments")
	var requestArguments:Any;
}

class ObsWebsocket extends IdeckiaAction {
	static var obs:ObsWebsocketJs;

	override public function init(_) {
		if (obs != null) {
			server.log("OBS already connected.");
			return;
		}

		obs = new ObsWebsocketJs();
		obs.connect({
			address: props.address,
			password: props.password
		}).then((_) -> {
			server.log("Success! We're connected & authenticated.");
		}).catchError((error) -> {
			obs = null;
			server.dialog(DialogType.Error, 'Error connecting to OBS: $error');
		});
	}

	public function execute(currentState:ItemState):js.lib.Promise<ItemState> {
		return new js.lib.Promise((resolve, reject) -> {
			var requestName = props.requestName;

			if (requestName == null)
				reject('The requestName can not be null');

			server.log('Sending request [name=$requestName, args=${props.requestArguments}]');
			obs.send(requestName, props.requestArguments).then(data -> {
				server.log('Received data: $data.');
			}).catchError((error) -> {
				reject('Error: $error');
			});

			resolve(currentState);
		});
	}
}
