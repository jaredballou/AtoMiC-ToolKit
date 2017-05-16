#!/usr/bin/env python

from glorpen.config import Config
from glorpen.config.fields import Dict, String, Path, LogLevel
import os
import yaml

app_list = [
	'couchpotato',
	'deluged',
	'emby-server',
	'headphones',
	'htpcmanager',
	'jackett',
	'kodi',
	'lazylibrarian',
	'madsonic',
	'muximux',
	'mylar',
	'nzbget',
	'nzbhydra',
	'ombi',
	'organizr',
	'phpsysinfo',
	'plexmediaserver',
	'plexpy',
	'pyload',
	'qbittorrent-nox',
	'radarr',
	'resilio-sync',
	'rtorrent',
	'rutorrent',
	'sabnzbdplus',
	'sickgear',
	'sickrage',
	'sonarr',
	'subsonic',
	'transmission-daemon',
	'ubooquity',
	'watcher',
	'webmin',
]
spec_app = Dict(
	ACCESSHOST = String(allow_blank = True),
	APPDEFAULTLOC = String(allow_blank = True),
	APPDEFAULTPASS = String(allow_blank = True),
	APPDEFAULTUNAME = String(allow_blank = True),
	APPDEPS = String(allow_blank = True),
	APPDOWNLOADURL = String(allow_blank = True),
	APPDPORT = String(allow_blank = True),
	APPGIT = String(allow_blank = True),
	APPINITDLOC = String(allow_blank = True),
	APPNAME = String(allow_blank = True),
	APPNEWPASS = String(allow_blank = True),
	APPPATH = Path(allow_blank = True),
	APPPIDFILE = Path(allow_blank = True),
	APPPIPS = String(allow_blank = True),
	APPREPOSITORYLINK = String(allow_blank = True),
	APPREPOSITORYLINKBACKUP = String(allow_blank = True),
	APPREPOSITORYNAME = String(allow_blank = True),
	APPSETTINGS = String(allow_blank = True),
	APPSETTINGSDIR = Path(allow_blank = True),
	APPSETTINGSDB = String(allow_blank = True),
	APPSETTINGSTYPE = String(allow_blank = True),
	APPSHORTNAME = String(allow_blank = True),
	APPSYSTEMD = String(allow_blank = True),
	APPSYSTEMD2 = String(allow_blank = True),
	APPSYSTEMDLOC = String(allow_blank = True),
	APPSYSTEMDLOC2 = String(allow_blank = True),
	APPSYSTEMDOVERIDE = String(allow_blank = True),
	APPTITLE = String(allow_blank = True),
	APPUSESNGINX = String(allow_blank = True),
	DBUSERNAME = String(allow_blank = True),
	DBPASSWORD = String(allow_blank = True),
	NEWPASS = String(allow_blank = True),
	NZBGET_BIN = Path(allow_blank = True),
	NZBGET_CONF = Path(allow_blank = True),
	PASSSEARCH = String(allow_blank = True),
	PID_FILE = Path(allow_blank = True),
	PORTSEARCH = String(allow_blank = True),
	REPKEYSERVER = String(allow_blank = True),
	REPOKEYSREQ = String(allow_blank = True),
	REPOPPA = String(allow_blank = True),
	REPRECVKEYS = String(allow_blank = True),
	REPRECVKEYSASC = String(allow_blank = True),
	REPRECVKEYSHORT = String(allow_blank = True),
	SCRIPTPATH = Path(default=os.getcwd()),
	UNAME = String(default="atomic"),
	USERSEARCH = String(allow_blank = True),
)

def main():
	for app in app_list:
		check_app(app)

def check_app(app):
	config_path = "apps/{}.yaml".format(app)
	cfg = Config(filepath=config_path, spec=spec_app).finalize()
	pprint(dir(cfg))
	pprint(cfg.data)

if __name__ == "__main__":
	main()
