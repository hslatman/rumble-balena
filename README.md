# rumble-balena

Run the Rumble network scanner on a device managed by Balena

## Description

Rumble is a cloud-based network discovery solution that uses one or more local agents performing active network and service discovery scans.
This repository is an example of how Rumble can be used with a device managed by Balena.

## Requirements

* A [Balena](https://www.balena.io/cloud/) account
* A [Rumble](https://www.rumble.run/) account
* A Raspberry Pi (this project has been tested with a RPi 3)

The `Rumble Starter` edition is free and can be used to discover up to 256 assets.

## Usage

### Rumble

You'll need to retrieve the download URL for your Rumble agent from [here](https://console.rumble.run/agents).
This example has been tested with a Raspberry Pi 3, so you need the Linux ARMv7 (32 bit) version.
Copying the URL is sufficient; you don't need to download the agent, because that's what Balena will do for you.

### Balena

Create a new application in your Balena account.
You can then push this `rumble-balena` project to the new Balena application using the Balena CLI as follows:

```bash
# login to Balena
$ balena login

# push the application to Balena (or to your device in local mode)
$ balena push <application>
```

When you run the application the first time it will fail, because the Rumble agent can't be downloaded.
The Rumble agent download URL should be made available as a `Service Variable` for the `agent` service (or as a `Device Variable`) in Balena, after which the service will restart.

## TODO

* Ensure that we can build using the download URL without needing it as service variable
* Add verification of binary using Rumble Verifier
* Easier configuration of Rumble download URL
* Support multiple architectures and devices
* Add Rumble scanner?
