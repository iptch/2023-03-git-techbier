# Personalized Git Techbier for CRU

> File for participant CRU

This file is the main test file on which you will perform your exercises. A
secondary file 'content.md' is used for  exercises.

This file is the entry point for all your exercises. A secondary file
`content.md` is the file which you will need to change to actually perform the
exercises.

## Amend

Switch to branch `CRU-main`. Oh no, there is a typo (or should I say "typoo") in
the last commit! Amend the commit to correct the commit message.

Oh no again, we wanted to have two exclamation marks (!!) on in the content.
Change the line in the content file to:

```
Hello world!!
```

Push all your changes to `CRU-main` again.

> Don't push as an extra commit! We only amended here, so there should only be
> the one commit with message
> `"fix: correct typoo in content for participant CRU"`.

## Merge

Merge branch `CRU-merge-branch` into `CRU-main`. Resolve any conflicts that might arise
by keeping the changes from `CRU-merge-branch`.

Don't forget to push your changes.

## Rebase

Switch to branch `CRU-rebase-branch` and rebase it **onto `CRU-main`**. Resolve any
conflicts that might arise by keeping the changes from `CRU-rebase-branch`.

Don't forget to push your changes.

## Squash

The branch `CRU-rebase-branch` should be 2 commits ahead of `CRU-main`. Squash the two
commits into a single commit with message:

```
feat: beautify world and ask participant CRU how (s)he is enjoying it
```

Don't forget to push your changes.

## Cherry Pick

Damn, there is an amazing commit on branch `CRU-cherry-pick-branch` with message:

```
feat: add content that should also be on CRU-main
```

This should indeed also be on `CRU-main`. Let's cherry-pick it onto main! Resolve
any conflicts that might arise by keeping the changes from `CRU-cherry-pick-branch`.

And ...
...yup, don't forget to push your changes.

## Tag

I think how that we merged `CRU-merge-branch` into `CRU-main` and added the amazing
commit from `CRU-cherry-pick-branch`, we could go live with version `1.0.0`!

Let's create a tag `CRU-v1.0.0` on the last commit on `CRU-main` and push it to the
remote.

## Reset

Now it's your time to show your Markdown skillz. Switch to branch `CRU-rebase-branch`
and modify `content.md` by adding whether you are a cat or a dog person, then
commit it, but don't push!

Ahhhhhh, turns out being a cat or dog person is sensitive information, let's
hard reset back to the status of `CRU-rebase-branch` that is on the remote.

## Stash

> You should be on branch `CRU-rebase-branch`.

Mhhh maybe we could add less sensitive information, like the meaning of life.
Add a line to `content.md` that says:

```
The answer to the meaning of life, the universe, and everything is ...
```

Ahhh you don't get time to find the answer to it, and a colleague asks you to
review his code on branch `CRU-life`. Stash your changes for later, and have a
look at the `CRU-life` branch. Once you have had a look, go back to
`CRU-rebase-branch` and finish your line, commit the changes, and push them.
