# Personalized Git Techbier for TSO

> File for participant TSO

This file is the main test file on which you will perform your exercises. A
secondary file 'content.md' is used for  exercises.

This file is the entry point for all your exercises. A secondary file
`content.md` is the file which you will need to change to actually perform the
exercises.

## Amend

Switch to branch `TSO-main`. Oh no, there is a typo (or should I say "typoo") in
the last commit! Amend the commit to correct the commit message.

Oh no again, we wanted to have two exclamation marks (!!) on in the content.
Change the line in the content file to:

```
Hello world!!
```

Push all your changes to `TSO-main` again.

> Don't push as an extra commit! We only amended here, so there should only be
> the one commit with message
> `"fix: correct typoo in content for participant TSO"`.

## Merge

Merge branch `TSO-merge-branch` into `TSO-main`. Resolve any conflicts that might arise
by keeping the changes from `TSO-merge-branch`.

Don't forget to push your changes.

## Rebase

Switch to branch `TSO-rebase-branch` and rebase it **onto `TSO-main`**. Resolve any
conflicts that might arise by keeping the changes from `TSO-rebase-branch`.

Don't forget to push your changes.

## Squash

The branch `TSO-rebase-branch` should be 2 commits ahead of `TSO-main`. Squash the two
commits into a single commit with message:

```
feat: beautify world and ask participant TSO how (s)he is enjoying it
```

Don't forget to push your changes.

## Cherry Pick

Damn, there is an amazing commit on branch `TSO-cherry-pick-branch` with message:

```
feat: add content that should also be on TSO-main
```

This should indeed also be on `TSO-main`. Let's cherry-pick it onto main! Resolve
any conflicts that might arise by keeping the changes from `TSO-cherry-pick-branch`.

And ...
...yup, don't forget to push your changes.

## Tag

I think how that we merged `TSO-merge-branch` into `TSO-main` and added the amazing
commit from `TSO-cherry-pick-branch`, we could go live with version `1.0.0`!

Let's create a tag `TSO-v1.0.0` on the last commit on `TSO-main` and push it to the
remote.

## Reset

Now it's your time to show your Markdown skillz. Switch to branch `TSO-rebase-branch`
and modify `content.md` by adding whether you are a cat or a dog person, then
commit it, but don't push!

Ahhhhhh, turns out being a cat or dog person is sensitive information, let's
hard reset back to the status of `TSO-rebase-branch` that is on the remote.

## Stash

> You should be on branch `TSO-rebase-branch`.

Mhhh maybe we could add less sensitive information, like the meaning of life.
Add a line to `content.md` that says:

```
The answer to the meaning of life, the universe, and everything is ...
```

Ahhh you don't get time to find the answer to it, and a colleague asks you to
review his code on branch `TSO-life`. Stash your changes for later, and have a
look at the `TSO-life` branch. Once you have had a look, go back to
`TSO-rebase-branch` and finish your line, commit the changes, and push them.
