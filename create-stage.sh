#!/usr/bin/env bash

set -euo pipefail
set -x

num="$1"
remote="origin"
main="$num-main"
merge="$num-merge-branch"
rebase="$num-rebase-branch"
thhgttg="$num-life"
cherry="$num-cherry-pick-branch"
declare -a branches=($merge $rebase $cherry $thhgttg)

function log {
  local text="$1"
  printf '\e[32;1m%s\e[0m\n' "=> $text"
}


# cleanup
log "performing cleanup"
for branch in "${branches[@]}"; do
  git branch -D $branch || true
  git push -d $remote $branch || true
done
git branch -D $main || true
git push -d $remote $main || true
git tag -d "$num-v1.0.0" || true
git push -d $remote "$num-v1.0.0" || true

[ -z ${CLEANUP_ONLY+x} ] || exit 0

log "switching to base"
git switch main
git pull

# create single starting commit
log "generating initial commit"
git switch -c $main
cat >README.md  << EOF
# Personalized Git Techbier for ${num}

> File for participant ${num}

This file is the main test file on which you will perform your exercises. A
secondary file 'content.md' is used for  exercises.

This file is the entry point for all your exercises. A secondary file
\`content.md\` is the file which you will need to change to actually perform the
exercises.

## Amend

Switch to branch \`$main\`. Oh no, there is a typo (or should I say "typoo") in
the last commit! Amend the commit to correct the commit message.

Oh no again, we wanted to have two exclamation marks (!!) on in the content.
Change the line in the content file to:

\`\`\`
Hello world!!
\`\`\`

Push all your changes to \`$main\` again.

> Don't push as an extra commit! We only amended here, so there should only be
> the one commit with message
> \`"fix: correct typoo in content for participant $num"\`.

## Merge

Merge branch \`$merge\` into \`$main\`. Resolve any conflicts that might arise
by keeping the changes from \`$merge\`.

Don't forget to push your changes.

## Rebase

Switch to branch \`$rebase\` and rebase it **onto \`$main\`**. Resolve any
conflicts that might arise by keeping the changes from \`$rebase\`.

Don't forget to push your changes.

## Squash

The branch \`$rebase\` should be 2 commits ahead of \`$main\`. Squash the two
commits into a single commit with message:

\`\`\`
feat: beautify world and ask participant $num how (s)he is enjoying it
\`\`\`

Don't forget to push your changes.

## Cherry Pick

Damn, there is an amazing commit on branch \`$cherry\` with message:

\`\`\`
feat: add content that should also be on $main
\`\`\`

This should indeed also be on \`$main\`. Let's cherry-pick it onto main! Resolve
any conflicts that might arise by keeping the changes from \`$cherry\`.

And ...
...yup, don't forget to push your changes.

## Tag

I think how that we merged \`$merge\` into \`$main\` and added the amazing
commit from \`$cherry\`, we could go live with version \`1.0.0\`!

Let's create a tag \`$num-v1.0.0\` on the last commit on \`$main\` and push it to the
remote.

## Reset

Now it's your time to show your Markdown skillz. Switch to branch \`$rebase\`
and modify \`content.md\` by adding whether you are a cat or a dog person, then
commit it, but don't push!

Ahhhhhh, turns out being a cat or dog person is sensitive information, let's
hard reset back to the status of \`$rebase\` that is on the remote.

## Stash

> You should be on branch \`$rebase\`.

Mhhh maybe we could add less sensitive information, like the meaning of life.
Add a line to \`content.md\` that says:

\`\`\`
The answer to the meaning of life, the universe, and everything is ...
\`\`\`

Ahhh you don't get time to find the answer to it, and a colleague asks you to
review his code on branch \`$thhgttg\`. Stash your changes for later, and have a
look at the \`$thhgttg\` branch. Once you have had a look, go back to
\`$rebase\` and finish your line, commit the changes, and push them.
EOF

cat >content.md <<EOF
# Content

Hello word!
EOF

git add .
git commit -am "chore: initial commit for participant $num"
git push -u $remote $main

# branch of here
log "generating feature branches"
for branch in "${branches[@]}"; do
  git branch $branch
  git push -u $remote $branch
done

# move main forward
log "generating extra commit on $main"
git switch $main
cat >content.md <<EOF
# Content

Hello world!
EOF

git commit -am "fix: correct typoo in content for participant $num"
git push

# generate content and conflict on merge branch
log "populating $merge"
git switch $merge
cat >content.md <<EOF
# Content

Hello world ... (sad face)
EOF
git commit -am "feat: change the mood to sad ..."
echo "...and hello participant $num!! (happy face)" >> content.md
git commit -am "feat: welcome participant $num!"
git push

# generate content and conflict on rebase branch
log "populating $rebase"
git switch $rebase
cat >content.md <<EOF
# Content

Hello beautiful world!
EOF
git commit -am "feat: make the world beautiful"
echo "Oops forgot to add: Hope you are enjoying the techbier so far!" >> content.md
git commit -am "feat: ask participant $num how (s)he is enjoying it"
git push


# generate content and conflict on cherry branch
log "populating $cherry"
git switch $cherry
echo "This is some cherry sweet content I would like to have on $main!" >> content.md
git commit -am "feat: add content that should also be on $main"
git push

# generate content on life branch
log "populating $thhgttg"
git switch $thhgttg
cat >solution.md <<EOF
It's 42!!!!!

If you want to know how to mindlessly waste computing power, or are especially
bored even though this is an amazing TechBier, here is an article that is quite
irrelevant: https://news.mit.edu/2019/answer-life-universe-and-everything-sum-three-cubes-mathematics-0910
EOF

git add .
git commit -m "feat: find the solution"
git push

# switch back to main branch to restore state
log "switching back to main"
git switch main

# vim:tw=80
