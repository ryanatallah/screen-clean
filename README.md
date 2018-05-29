## Screen Clean

The `screen-clean` utility is a daemon which runs on a regular interval to automatically clean up old screenshots from your Desktop by moving them to a `Screenshots` directory.

Parameters:

- `EXP_TIME`: the amount of time which must elapse before a screenshot is considered "old", and is cleaned up by the script
- `LOG_FILE`: the file where logs should be written

You can run the script manually, or you can run the `install.sh` script to load a `launchctl` service to automatically run the daemon every 15 minutes using the template service config file `com.ryanatallah.screen-clean.plist`. You'll want to change the username in the `.plist` file to match your own before installing.
