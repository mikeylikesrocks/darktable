# [Darktable](https://www.darktable.org/)

**Description**

Darktable is an open source photography workflow application and raw developer. A virtual lighttable and darkroom for photographers. It manages your digital negatives in a database, lets you view them through a zoomable lighttable and enables you to develop raw images and enhance them.


**Build notes**

[Latest Darktable release](https://software.opensuse.org/download.html?project=graphics:darktable&package=darktable) in a docker container based on Linuxserver.io's [lsiobase/rdesktop-web:bionic-java](https://hub.docker.com/r/lsiobase/rdesktop-web) Ubuntu 18.04 LTS image.

GUI can be accessed from RDP or HTTP (via [guacamole](https://guacamole.apache.org/) ).  Connecting from protocols at the same time will lead to an unstable connection.


**Usage**
```
docker run -d \
 	-p 8080:8080 \
 	-p 3389:3389 \
 	-e PUID=1000 \
  	-e PGID=1000 \
  	-e TZ=America/Los_Angeles \
 	-v </host/path/to/appdata>:/config \
 	-v </host/path/to/images>:/images \
 	mdschaefer/darktable

```

Replace all user variables in the above command defined by < > with the correct values.



**Access via web interface**

`<host ip>:8080` unless port was changed


**Access via RDP client**

`<host ip>:3389` unless port was changed


**Environment variables**


| Parameter | Function |
| :----: | ---- |
| `-p 8080` | Allows HTTP access to Darktable. |
| `-p 3389` | Allows RDP access to Darktable. |
| `-e PUID=1000` | Specify UserID  |
| `-e PGID=1000` | Specify GroupID  |
| `-e TZ=America/Los_Angeles` | Specify a timezone to use |
| `-v /config` | Contains Darktable config folder with library database and preview cache |
| `-v /images` | location of mapped folder in guest  |



**Username and Password**

Default username is `abc` and shouldn't be changed
Default password is `abc` and can be changed by running the below command on the host.

`docker exec -it darktable passwd abc`
