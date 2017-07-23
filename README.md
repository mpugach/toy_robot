# ToyRobot
[![Build Status](https://travis-ci.org/mpugach/toy_robot.svg?branch=master)](https://travis-ci.org/mpugach/toy_robot)

This is yet another solution for a Toy Robot coding puzzle. The puzzle was provided by Jon Eaves.

## Installation

Execute:

    $ gem install specific_install
    $ gem specific_install -l https://github.com/mpugach/toy_robot

## Usage

Execute:

    $ toy_robot

Supported input:

    PLACE 0,0,NORTH
    MOVE
    LEFT
    RIGHT
    REPORT

The tabletop is square, of dimensions 5 units x 5 units.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/toy_robot.
