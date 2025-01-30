# So this is the second time (drive).
# Let's see if I take better notes this time.
# Four hashes #### meas not used on this go around

# RClone setup installation, story notes, sanitized for git

# Note: for mounting a local drive https://rclone.org/commands/rclone_mount/

#     To mount it as a drive:
#         Nope: rclone mount JKSFO.Resume: /home/jku/JKSFO.Resume/
#     or silent
#         rclone mount --daemon JKSFO.Resume: /home/jku/JKSFO.Resume/
#     unmount
#         # Linux
#         fusermount -u /path/to/local/mount
#
# Currently mounted drives
#   df -h
#
# Target: JKSFO.Resume

JKSFO.Resume/work
https://drive.google.com/drive/folders/1mHafDSgrChApSxXzuu_iHD0qkvnyomWd

Using RCloneSetup1.txt as a guide
https://forum.rclone.org/t/how-to-create-and-use-a-google-drive-client-id/9605
Should be able to use the same API Keys

> rclone setup

> n (New remote)

> 17 (Google Drive)

>   ClientID:920225360967-67b3haduhbsbp8f9m15abfq25kf3be8p.apps.googleusercontent.com

>   Secret: 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

> 1 (full access)

> blank (no service account)

> n (no advanced config)

> y (web browser)

  > prolly need to switch from brave to chrome
  > need to c/p URI since I am linking accounts, borrowing the credentials from
  josephkelly.resume

> n (not a team drive)

> y (keep remote)
Configuration complete.
Options:
- type: drive
- client_id: 920225360967-67b3haduhbsbp8f9m15abfq25kf3be8p.apps.googleusercontent.com
- client_secret: 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
- scope: drive
- token: {"access_token":"ya29.a0AcM612w2W8bZU8I-MxtHv2_QebE49ZqkkkIogajp457zXUit3Mftn4edXxPvy_d1DNpKDS6tHmkcCEJpZLoG4igKjKpOFRxkrYnxINA2KtVld8EmZTy3jqeLeEr7cHUPuvzPkpv6PLL4EqQmGoJz5NQLjkxW6KbGqFZbaCgYKAbQSARASFQHGX2MiaYDXgQ6h-vpkQ4agyPvXnw0171","token_type":"Bearer","refresh_token":"1//06aR67F__VziTCgYIARAAGAYSNwF-L9Ir-kaZuAXSOMr59isODnZcEXMcTBynXmd4AXpQDZauwD2GGt7tAvv6cXtTYzAZ1qpDWoA","expiry":"2024-08-03T13:52:46.858014401-07:00"}
- team_drive:
Keep this "JKSFO.Resume" remote?

> Y

/////////////////
(from config file: less ~/.config/rclone/rclone.conf)
[JKSFO.Resume]
type = drive
client_id = 920225360967-67b3haduhbsbp8f9m15abfq25kf3be8p.apps.googleusercontent.com
client_secret = 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
scope = drive
token = {"access_token":"ya29.a0AcM612w2W8bZU8I-MxtHv2_QebE49ZqkkkIogajp457zXUit3Mftn4edXxPvy_d1DNpKDS6tHmkcCEJpZLoG4igKjKpOFRxkrYnxINA2KtVld8EmZTy3jqeLeEr7cHUPuvzPkpv6PLL4EqQmGoJz5NQLjkxW6KbGqFZbaCgYKAbQSARASFQHGX2MiaYDXgQ6h-vpkQ4agyPvXnw0rclone.conf

/////////////////
JKSFO.Resume
	PurpleHors3#
	jksfo.resume@gmail.com

/////////////////
> Do this ...

2024/06/01 12:32:00 NOTICE: Make sure your Redirect URL is set to "http://127.0.0.1:53682/" in your custom config.
2024/06/01 12:32:00 NOTICE: If your browser doesn't open automatically go to the following link: http://127.0.0.1:53682/auth?state= abc
2024/06/01 12:32:00 NOTICE: Log in and authorize rclone for access
2024/06/01 12:32:00 NOTICE: Waiting for code...
2024/06/01 12:32:25 NOTICE: Got code
Configure this as a Shared Drive (Team Drive)?
/////////////////
> rclone config (confirm)

Name                 Type
JKRGDrive            drive
JKSFO.Resume         drive
q) Quit config
/////////////////
rclone ls JKRGJKSFO.Resume:

######################################

rclone ls JKSFO.Resume:

jku@jkMain:~/.config/rclone$ rclone ls JKSFO.Resume
2024/08/03 13:12:30 NOTICE: "JKSFO.Resume" refers to a local folder, use "JKSFO.Resume:" to refer to your remote or "./JKSFO.Resume" to hide this warning
2024/08/03 13:12:30 ERROR : : error listing: directory not found
2024/08/03 13:12:30 Failed to ls with 2 errors: last error was: directory not found

Going back to instructions, trying this ...

list local contents:
 rclone ls JKSFO.Resume

list remote contents:
 rclone ls JKSFO.Resume:

######################################

Good, now to mount ... make sure local dir is empty
  jku@jkMain:~$ rclone mount --daemon "JKSFO.Resume:" /home/jku/JKSFO.Resume

Write some kind of file to the dir for force it to synch ... and it works!

unmount
    fusermount -u /path/to/local/mount

Also

######################################

