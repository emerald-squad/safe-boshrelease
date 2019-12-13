# strongbox

- Changed deployement model, separating consul servers and consul clients with vault nodes
- Added TLS in consul server to server communication
- Integrated consul DNS with bosh DNS on all nodes that runs a consul-client
- Fixed bug where vault will run without memory lock
- Added a drain mechanism on vault node to try to minimise downtime on restart
- Bumped strongbox to v0.0.4
- Bumped consul to v1.6.2
