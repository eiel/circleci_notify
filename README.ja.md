# これは何?

Circle CI 上で実行すると通知できるgemです。
現在はChatworkのみに対応しています。

このGemはきっとボツになります。

```ruby
gem 'circleci_notify', group: :test
```

とかしといて `circle.yml` の好きなタイミングで

`bundle exec bin/circleci_notify 'MESSAGE'`

を挿入すれば利用できます。


例

```yaml
test:
  post:
    - bin/circleci_notify Ended
deployment:
  production:
    branch: master
    commands:
      - echo deploy
      - bin/circleci_notify Deploy Ended
```

![通知例](https://cloud.githubusercontent.com/assets/92595/4588718/995dba3e-5048-11e4-95db-53680b158968.png)
