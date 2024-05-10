# Reminder

![](https://img.shields.io/badge/powered_by-hand-orange?style=for-the-badge) ![](https://img.shields.io/badge/with_♥-red?style=for-the-badge)


How to securely remember a password for a certain time ?

Use case: I need to make an `lftp` connection and enter my password. It's likely that I'll restart the command several times during my work session.

Extract from a Makefile

```bash
put: 
	@lftp -e "put -O something ; bye"\
	 -u somelogin,$(shell ./remember.sh somelogin) sftp://ftp.example.org
```

_See example of `Makefile`_

## Changelog

- _v -1_ Attempt to save passwords in an environment variable.
    Bad idea. Environment variables _envars_ are accessible to all processes.

- _v 0.1_ Use of Ante's proof of concept (POC) that uses the Linux keyring via the `keyctl` command.
    See <poc-remember-ante.sh>… it works.

## Authors

Pierre Bettens (pit) <pb@namok.be>  
Ante 


[![CC](cc-by-sa.png)](http://creativecommons.org/licenses/by-sa/4.0/deed.fr)
