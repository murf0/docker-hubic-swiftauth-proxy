# Nodejs hubiC Swift Authentication - Dockerized
Based on: https://github.com/gierschv/node-hubic-swiftauth
**This script is written for my personal usage, is unofficial and consequently not maintained by OVH.**

### Added
Dockeriziation.
Added SSL support.
Generates SSL-certificats on start. (Prints sha256 fingerprint, verify your connection)

### How to run:
* Build image:
```
git clone https://github.com/murf0/node-hubic-swiftauth.git
docker build -t hubicswiftauth .
```

* Run it:
```
docker run -it --rm \
-e APP_KEY=\
-e APP_SECRET= \
-e BASE_URL=/ \
-e HOST=\
-p 8080:8080 \
--name hubicswiftauth hubicswiftauth
```

## Cyberduck
[Run the V1 auth file](https://svn.cyberduck.ch/trunk/profiles/Openstack%20Swift%20(v1).cyberduckprofile) and select Swift v1 as connection.
1. Paste the Auth URL into server. (This resets your selection) 
2. select Openstack swift v1 again. Port is now reset, If not using 443 Change this.
3. Set username to hubic. -> Connect
4. Input key and connect


**This script is written for my personal usage, is unofficial and consequently
not maintained by OVH.**

This script provides a simple Node.js HTTP server responding to a standard
OpenStack Swift authentication request (v1.0) using the hubic OAuth API.
Tested with *Swift CLI* and *Cyberduck*.

### Usage

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
