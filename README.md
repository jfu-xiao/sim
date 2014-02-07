# Rspec-Capybara-Jenkins

## Key benefits

- Integrate Capybara with:
Jenkins
parallel_test
thread-safe HTML reporting
- pre-configured switch between:
local
remote
fail fast

## Setup

sim requires Ruby 1.9.3 or later. To install, type:

```bash
gem install sim
```

## Run rspec

Remotely:
```bash
bundle exec rspec -r 'sim/remote'
```

Locally:
```bash
bundle exec rspec -r 'sim/local'
```

Headlessly:
```bash
bundle exec rspec -r 'sim/local_phantomjs'
```

## Run cucumber with package locally
Add the following to root/features/support/env.rb
```bash
require 'sim/local'
```




