# MACBETH ANALYZER

See this site running [here](https://macbeth-analyzor.herokuapp.com/)!

## Local installation:

  * `git clone https://github.com/matchajune/macbeth-analyzer.git`
  * `cd macbeth-analyzer`
  * `bundle install`
  * `rake db:create; rake db:migrate; rake db:seed`
  * `puma`

## Tests

The test is testing the MacBeth class that is used to import the book into the app. I took the first scene from the first act as a smaller sample size.

The tests cover:

  1. The correct numbers for the Models are created.
  2. The relationships are built correctly.

You can `rspec` to run the tests locally.
