# NPSInstall

## Cisco AAA Code

```
Username user privilege 15 secret cisco
AAA new-model
AAA group server radius Basicnet
Server-private 172.16.1.10 auth-port 1812 acct-port 1813 key cisco
Exit
AAA authentication login default group Basicnet local
AAA authorization exec default group Basicnet local if-auth
AAA authorization console
```