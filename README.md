# SSDev Framework

## What is it?
This is a framework for developing SSDev resources. Its purpose is to provide a common interface for all SSDev resources. It is not intended to be used directly, but rather as a base for other SSDev resources.
It comes with a set of tools for managing the resources and some helpful tools like Logging.

## Installation
- Simply download the zip of this repo and extract it to your resources folder. Its recommeneded to keep all SSDev resources in a folder called "[ssdev]".
- Open your server.cfg and add the following line to the end of the file:
```lua
ensure [ssdev] -- Or if you placed somewhere else, ensure that instead
```

## Configuration
Theres no specific configuration you need to do to get this working, its simply a drag and drop. 
By default this works with QBCore & ESX (es_extended). 
If you need to add your own framework support take a look at the shared/loader.lua file (mainly the predefinedFrameworks variable) and then look at the files in client/frameworks/\*.lua & server/frameworks/\*.lua to see what you need to implement in your own framework.

## Exports
| Export | Description |
|:-------|:------------|
| `GetLogger(prefix: string, loggingLevel: int)` | Gets an instance of the Logger using its own prefix and logging level |
| `GetFramework(framework: optional\|string)` | If an active framework was found you can call this parameterless. Else you can provide a framework name to get the core framework object. E.G. for es_extended it will provide you the ESX object on both client & server side respectively |

## License
MIT