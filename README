rmuser-2step - a 2-script (and 2-step) user removal tool
========================================================

These scripts allow us to safely delete large amounts of users from large amounts of servers. Steps are easy and painless!

1. Run 'lockuserfindfiles.sh <user>' (the script accepts multiple users as arguments)
2. Use the resulting list to reassign any required files that are owned by these users
3. Run 'deletelockeduserandalltheirstuff.sh <user>'
4. Your users have been deleted - there is no four!

Here's some features:

- Each script checks to see if a user exists before running anything against them
- If a user doesn't exist then the script will still run against any remaining users (handy when running against multiple servers)
- Users are locked before being deleted, which is nice and safe
- Handy list of user-owned files to tidy up at your (and the customers') leisure
- When a user is deleted, so are all the files it owns (Yes! This is actually a feature!)
- Works efficiently with multiple users and scales well
- Works great with HammerTime!

Here's a slightly more in-depth version of events. However, I recommend reading the scripts anyway so you understand fully what's happening:

1. Run 'lockuserfindfiles.sh <user1> <user2> ..'
2. The script will first check that each user exists. If a user exists, the account will be locked.
3. For all users that actually exist on the server, a single find command will then be run. All files owned by each user will then be listed out.
4. Use the find output to reassign all user-owned files as necessary.
5. Run 'deletelockeduserandalltheirstuff.sh <user1> <user2> ..'
6. This script will then check to see if each user is locked, and if so they are deleted along with any files they own.

FAQ
===

Q. Why do we need a script for this?

A. For one user, on one machine, you dont. This is useful for cases when a customer wants 5 users deleted, or users being deleted across 20 servers (or both). Note: It's still handy to use these scripts anyway, as it enforces best practice.

Q. Why on earth are you deleting files? We're only meant to be deleting users!

A. When a user is deleted it leaves the ownership in limbo - and we shouldn't be letting this happen. You should use the handy list from the first script to reassign the files to new owners where necessary, but it's likely there are always 4-5 files that can just be ignored and deleted ('.bash_history' for example). Use your best judgement when running the second script, informed by the data coming out of the first one.

Q. Why lock a user first? What's wrong with a one-step process?

A. It's all about the file limbo. There are probably other reasons too.

Q. The scripts aren't well commented enough.

A. That's not a question, but COME ON! There's a comment on NEARLY EVERY LINE! It's more comment than code! It's a fscking novel!

Q. I see a mistake/I've found a bug/you're doing it wrong.

A. Again, not questions, but there's an issue tracker on this project. Submit an issue and I'll try to get it fixed. I also accept pull requests, so if you know what's wrong I'd really appreciate it if you just fixed it yourself and pushed it upstream :) (if you don't know how this works, now is a great time to learn! It'll make you a better SysAdmin, I promise!)

Q. I ran your script and you destroyed a customer's server!

A. No, you ran my script and *YOU* destroyed a customer's server. I provide these scripts as-is - if you don't understand what's going on you probably shouldn't be using them. I've taken the leg work out of making your own scripts (and I'm pretty certain I've put enough fail-safe mechanisms in place), but I'm not absolving you of responsibility for doing your job. The buck stops with you boy-o.
