# polls_api

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]


[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis


## 📝 Description
A polls api using dart_frog.
- localhost/polls
- localhost/polls/[id]

<h2>☢️ This is a sample project and <a href="https://github.com/VeryGoodOpenSource/dart_frog">dart_frog</a> is currently experimental. ☢️</h2>

## ⚙️ TechStack/framework used

- [postgrSQL](https://www.postgresql.org/download/)
- [Dart Frog](https://pub.dev/packages/dart_frog)


## 🚀&nbsp; How it works

This project uses [postgres](https://pub.dev/packages/postgres) as its database.

- Create a `.env` file at the root of the project which would include the data below for the postgres connection:

```
DB_HOST=
DB_PORT=
DB_NAME=
DB_USERNAME=
DB_PASSWORD=
```

- Get the project packages

```
dart pub get
```

- All done!

## 🚀&nbsp; Start the server

You can simply run `dart_frog dev`. For more information check out [dart_frog](https://github.com/VeryGoodOpenSource/dart_frog).