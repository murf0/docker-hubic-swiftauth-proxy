# Nodejs hubiC Swift Authentication Proxy - Dockerized
Based on: [https://github.com/gierschv/node-hubic-swiftauth]

**This script is written for my personal usage, is unofficial and consequently not maintained by OVH.**

### Added
- Dockeriziation.
- Added SSL support.
- Generates SSL-certificats on start. (Prints sha256 fingerprint, verify your connection)

## How to run:
### Build image:
```
git https://github.com/murf0/docker-hubic-swiftauth-proxy.git
docker build -t hubicswiftproxy docker-hubic-swiftauth-proxy
```

### Run it:
```
docker run\
-e APP_KEY=<Client ID>\
-e APP_SECRET=<Secret Client> \
-e BASE_URL=<Redirection domain>/ \
-e HTTPS=TRUE \
-p <PORT In BASE_URL>:8080 \
--name hubicswiftauth hubicswiftproxy
```

### SSL
If you wish to override the generated SSL-certificate mount a volume on /usr/
```
-v "<path to server.key & server.crt>:/usr/src/app/SSL/"
```

## Usage

*  Create a hubiC application on hubic.com (My account > Your applications).

* Launch the script:
```
$ export APP_KEY=api_hubic_xxx
$ export APP_SECRET=42
$ export BASE_URL=https://example.com/
$ node hubic-swiftauth.js
```

* Go on the base url your specified (here https://example.com/), log in using
your hubiC credentials and you'll get this message:

```
Now you can use the Swift v1 API using these credentials:
	Endpoint: https://example.com/
	User: hubic
	Password: my-token
Example if you use the swift cli client:
	$ swift -A https://example.com/auth/v1.0 -U hubic -K my-token
```
* You can now use these credentials until you revoke them.

## Tested Applications
### Cyberduck

1. [Run the V1 auth file](https://svn.cyberduck.ch/trunk/profiles/Openstack%20Swift%20(v1).cyberduckprofile) and select Swift v1 as connection.
2. Paste the Auth URL into server. (This resets your selection) 
3. select Openstack swift v1 again. Port is now reset, If not using 443 Change this.
4. Set username to hubic. -> Connect
5. Input key and connect
