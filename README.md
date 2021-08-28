## Docker image for legacy RForge services

This is a compatibility container for the [RForge.net](https://rforge.net) services.
Since our new infrastructure moved away from legacy services such as Apache this is the shortest path to retain the existing service with minimal changes while we decommission the old servers.

The service requires `/www/rforge` mount with the actual contents of the RForge repository.
Optionally, `/var/svnroot` can be also mounted to provide a legacy SVN server for projects that are not hosted on GitHub.
