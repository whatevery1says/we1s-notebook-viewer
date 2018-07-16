## Development

To drop into a running container shell for testing and development:

(Note: `ginx:alpine` has only `sh`, not `bash`)

-  via Docker on host command line:
   -  `docker exec -it <containerIdOrName> sh`
-  via Synology Docker:
   -  `Menu > Docker > Container > <nginx>`
   -  Terminal > Create: launch with command > "sh"
-  via Portainer:
   -  Containers > <nginx> > Quick actions > Console

To test configurations from a shell inside a running container:

-  In terminal:
   -  edit settings:  
	     `vi etc/nginx/conf.d/default.conf`
   -  reload settings without restarting ngingx / container:
      `nginx -s reload`

