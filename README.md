# Action for ideckia: Obs-Websocket

## Definition

Connect to obs-websocket


## Properties

| Name | Type | Description | Default | Possible values |
| ----- |----- | ----- | ----- | ----- |
| address | String | Obs address | "localhost:4444" | null |
| password | String | Obs password | null | null |
| request_arguments | Any | Obs request arguments | null | null |
| request_name | String | Obs request name | null | null |


## Example in layout file

```json
{
    "state": {
        "text": "to first scene",
        "bgColor": "00ff00",
        "action": {
            "name": "obs-websocket",
            "props": {
                "address": "localhost:1234",
                "password": "my_password",
                "request_name": "SetCurrentScene",
                "request_arguments": {
                    "scene-name": "first-scene"
                }
            }
        }
    }
}
```

### Set scene

```json
"request_name": "SetCurrentScene",
"request_arguments": {
    "scene-name": "first-scene"
}
```

### Show source

```json
"request_name": "SetSceneItemProperties",
"request_arguments": {
    "item": "my-source",
    "visible": true
}
```

### Mute microphone

```json
"request_name": "SetMute",
"request_arguments": {
    "source": "MainMic",
    "mute": true
}
```

## Server

OBS WebSocket plugin (version 4.x.x) must be installed in order to work. Download from [here](https://github.com/Palakis/obs-websocket/releases).
