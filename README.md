# SSDev Framework

## What is it?
This is a framework for developing SSDev resources. Its purpose is to provide a common interface for all SSDev resources. It is not intended to be used directly, but rather as a base for other SSDev resources.
It comes with a set of tools for managing the resources and some helpful tools like Logging.

## Exports
| Export | Description |
|:-------|:------------|
| `GetLogger(prefix: string, loggingLevel: int)` | Gets an instance of the Logger using its own prefix and logging level |
| `GetFramework(framework: optional|string)` | If an active framework was found you can call this parameterless. Else you can provide a framework name to get the core framework object. E.G. for es_extended it will provide you the ESX object on both client & server side |

## License
MIT