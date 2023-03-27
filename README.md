# Git Techbier

## Generate User Context

Generate a user's context with:

```bash
bash ./create-stage.sh <user>
```

Then you can switch to your personalized branch and start the exercises:

```bash
git switch <user>-main
```

Once your are done, run the following to clean up your environment:

```bash
env CLEANUP_ONLY=true bash ./create-stage.sh <user>
```

## Reset Environment

Simply rerun the following in order to reset the environment:

```bash
bash ./create-stage.sh <user>
```
