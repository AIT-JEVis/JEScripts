from __future__ import print_function
from __future__ import unicode_literals

from jeapipy.jeapi import JEVisConnector

server = "http://localhost:8080/JEWebService/v1"
user = "Sys Admin"
password = "jevis"

con = JEVisConnector(server, user, password)

if not con.isConnected():
	print("Error: could not connect to server")
	exit(1)

roots_children = con.getChildren('1')

org_dir_id = ""
for child_id in roots_children:
	child = con.getObject(child_id)
	print("child: ", child_id, " ", child['name'])
	if child['name'] == 'Organization Directory':
		print("found it")
		org_dir_id = child_id
		break

if org_dir_id == "":
	print("Error: could not get Organization Directory")
	exit(2)

org_ids = con.getChildren(org_dir_id)
for org_id in org_ids:
	org = con.getObject(org_id)
	if org['jevisclass'] == 'Organization':
		print('delete %s %s' % (org_id, org['name']))
		con.deleteObject(org_id)

