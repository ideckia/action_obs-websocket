# Action for ideckia: Obs-Websocket

## Definition

Connect to obs-websocket


## Properties

| Name | Type | Description | Default | Possible values |
| ----- |----- | ----- | ----- | ----- |
| address | String | Obs address | "localhost:4444" | null |
| password | String | Obs password | null | null |
| requestArguments | Any | Obs request arguments | null | null |
| requestName | String | Obs request name | null | null |


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
                "requestName": "SetCurrentScene",
                "requestArguments": {
                    "scene-name": "first-scene"
                }
            }
        }
    }
}
```

## Server

OBS WebSocket plugin must be installed in order to work. Download from [here](https://github.com/Palakis/obs-websocket/releases)
