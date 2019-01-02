# BuiltJsonSchema

[![LICENSE][LICENSE-shield]][LICENSE]
[![Build status][travis-shield]][repo]
[![Code coverage][code-coverage-shield]][repo]
[![Pub version][pub-version-shield]][pub-link]
[![Commitizen friendly][commitizen-shield]][commitizen]
[![Commitizen style][commitizen-style-shield]][cz-emoji]
[![Maintained][maintenance-shield]][repo]

## :rocket: About

Generate built_value models from json schema

## :book: Usage

## :traffic_light: Versioning - [semver]

This project follows Semantic Versioning 2.0.0

## :newspaper: Changelog

Changes for latest release at [github-releases]

## :memo: Milestones

- [ ] Prepare v1.0.0

## :busts_in_silhouette: Contributing

- :fork_and_knife: Fork this repo

- ⬇️ Clone your forked version  
  `git clone https://github.com/<you>/built_json_schema.git`

- :heavy_plus_sign: Add this repo as a remote  
  `git remote add upstream https://github.com/devkabiir/built_json_schema.git`

- :arrow_double_down: Make sure you have recent changes  
  `git fetch upstream`

- :sparkles: Make a new branch with your proposed changes/fixes/additions  
  `git checkout upstream/master -b name_of_your_branch`

- :bookmark_tabs: Make sure you follow guidelines for [Git](#git)

- :arrow_double_up: Push your changes  
  `git push origin name_of_your_branch`

- :arrows_clockwise: Make a pull request

## :octocat: Git

- :heavy_check_mark: Sign all commits. Learn about [signing-commits]
- Use [commitizen] with [cz-emoji] adapter
- Check existing commits to get an idea
- Run the pre_commit script from project root `pub run pre_commit`
- If you're adding an `and` in your commit message, it should probably be separate commits
- Link relevant issues/commits with a `#` sign in the commit message
- Limit message length per line to 72 characters (excluding space required for linking issues/commits)
- Add commit description if message isn't enough for explaining changes

## :lipstick: Code style

- Maintain consistencies using included `.editorconfig`
- Everything else as per standard dart [guidelines]

## :white_check_mark: Testing

- Add tests for each new addition/feature
- Do not remove/change tests when refactoring
  - unless fixing already broken test.

## :sparkles: Features and :bug:bugs

Please file feature requests and bugs at the [issue-tracker].

## :scroll: License

Copyright (C) 2018-Present Dinesh Ahuja <dev@kabiir.me>.

Please see the [LICENSE] file in this repository for the full text

<!-- Shield aliases -->
[LICENSE-shield]: https://img.shields.io/github/license/devkabiir/built_json_schema.svg
[travis-shield]: https://img.shields.io/travis/com/devkabiir/built_json_schema/master.svg
[code-coverage-shield]: https://img.shields.io/codecov/c/github/devkabiir/built_json_schema/master.svg
[pub-version-shield]: https://img.shields.io/pub/v/built_json_schema.svg
[commitizen-shield]: https://img.shields.io/badge/commitizen-friendly-brightgreen.svg
[commitizen-style-shield]: https://img.shields.io/badge/commitizen--style-emoji-brightgreen.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2018.svg

<!-- Link aliases -->
[cz-emoji]: https://github.com/ngryman/cz-emoji
[commitizen]: http://commitizen.github.io/cz-cli/
[pub-link]: https://pub.dartlang.org/packages/built_json_schema
[repo]: https://github.com/devkabiir/built_json_schema
[guidelines]: https://www.dartlang.org/guides/language/effective-dart/style
[signing-commits]: https://help.github.com/articles/signing-commits/
[issue-tracker]: https://github.com/devkabiir/built_json_schema/issues
[LICENSE]: https://github.com/devkabiir/built_json_schema/blob/master/LICENSE
[semver]: https://semver.org/
[github-releases]: https://github.com/devkabiir/built_json_schema/releases
