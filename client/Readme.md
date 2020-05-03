# Client

The client-side that the user interacts with. It has onlye one duty, show data to user and nothing more.

## Endpoints

- **[/report/{username}**
	- Gives report of the requested user
	- Before requesting `service-analyzer`, it looks in his DB to check if there is any fresh data (within last 1 hour), to prevent useless operations
	- The DB is synchronized with `service-analyzer` (users & logs)