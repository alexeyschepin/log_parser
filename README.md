# Application to process website logs and print statistics

## Processing steps

1. Parse log file
2. Group by and order desc
    1. page views
    2. unique page visitors
3. Render pages
    1. page views
    2. unique page views

## Commands

### Execution
```
./parser.rb examples/webserver.log
```

### Rake commands
```
rake coverage              # Run RSpec with coverage
rake rspec:integration     # Testing RSpec Integration
rake rspec:unit            # Testing RSpec Unit
rake rubocop               # Run RuboCop
rake rubocop:auto_correct  # Auto-correct RuboCop offenses
```

## TODO
1. Fix simplecov. It doesn't show the correct result
2. Add validation to LogParser for file format
