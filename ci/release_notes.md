Attention : This version breaks compatibilty with previous ones. The changes made in the deployment model make the upgrade impossible.
To upgrade, you must manually backup your previous safe installation by using a consul snapshot then restore the backup in the new deployment
(on any consul server node)

- Changed deployement model, separating consul servers and consul clients with vault nodes
- Added TLS in consul server to server communication
- Integrated consul DNS with bosh DNS on all nodes that runs a consul-client
- Fixed bug where vault will run without memory lock
- Added a drain mechanism on vault node to try to minimise downtime on restart
- Bumped strongbox to v0.0.4
- Bumped consul to v1.6.2
- Bumped vault to v1.3.0
