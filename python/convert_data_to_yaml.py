#!/usr/bin/env python

import os
import re
import sys
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

def main():
	for app in app_list:
		convert_app(app)

def convert_app(app):
	print("Converting {}".format(app))
	config_path = "apps/{}.yaml".format(app)
	config = {}
	config['constants'] = get_constants(app)
	config['backup_files'] = get_backup_files(app)
	yout = re.sub(r'\'\'|""', '', yaml.dump(config, default_flow_style=False, explicit_start=True))
	with open(config_path, 'w') as file:
		file.write(yout)

def get_backup_files(app):
	file = "{}/{}-backup-files".format(app,app)
	if not os.path.exists(file):
		return {}
	with open(file,'r') as f:
		return f.read().splitlines()

def bash_to_yaml_string(value):
	matches = re.findall(r'(\$[\{]*)([^\/\$"\'\s\:}]+)([\}]*)', value)
	for match in matches:
		var = "{{{{ {} }}}}".format(match[1])
		rep = ''.join(match)
		value = value.replace(rep, var)
	return value

def get_constants(app):
	file = "{}/{}-constants.sh".format(app,app)
	values = {}
	output = open(file,'r').readlines()
	for line in output:
		match = re.search('^([^#=]+)=(.+)$', line)
		if match:
			values[match.group(1)] = bash_to_yaml_string(match.group(2))
	return values

if __name__ == "__main__":
	main()

