#!/usr/bin/env python

from glorpen.config import Config
from glorpen.config.fields import Dict, String, Path, LogLevel
import os
import yaml

# BASH config variables. Get this out of here.
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
	pass

def write_app_list():
	# Write app list
	with open("apps.yaml", 'w') as file:
		file.write(yaml.dump(app_list, default_flow_style=False, explicit_start=True))

def write_config_schema():
	# Write config schema
	with open("config.schema.yaml", 'w') as file:
		file.write(yaml.dump(spec_app, default_flow_style=False, explicit_start=True))
def write_apps():
	for app in app_list:
		check_app(app)

def check_app(app):
	config_path = "apps/{}.yaml".format(app)
	cfg = Config(filepath=config_path, spec=spec_app).finalize()
	pprint(dir(cfg))
	pprint(cfg.data)

if __name__ == "__main__":
	main()
