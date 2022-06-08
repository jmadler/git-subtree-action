# git-subtree-action

A GitHub Action to run `git subtree` commands.  [Git
subtrees](https://github.com/git/git/blob/master/contrib/subtree/git-subtree.txt) are a way to link repositories
together.

## Usage

| Input        | Description                                            | Required |
| ------------ | ------------------------------------------------------ | -------- |
| github_token | GitHub Access Token                                    | True     |
| git_name     | Git User Name                                          |          |
| git_email    | Git User Email                                         |          |
| repo         | Repository                                             |          |
| action       | Action (subtree command)                               | True     |
| position     | Branch, Commit, Ref, or Refspec (depending on command) |          |
| prefix       | Prefix path                                            |          |
| squash       | Whether or not to squash the merge                     |          |
| message      | Message (depending on command)                         |          |

## License

This project is copyright Jordan M. Adler and licensed under the MIT License.
