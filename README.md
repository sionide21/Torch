Ruby Scripting Extensions
=========================

Some extensions to make ruby shell scripting easier.

## Installation

Torch is available at rubygems.

    gem install torch


## Usage

To enable the extensions, simply `require 'torch'` at the top of your file.

### Examples

Below are some basic examples of torch. More examples can be found in the Examples directory.

#### Command line arguments

Additional methods are added to `ARGV` to help with common tasks.

Take the following file called `test.rb`:

    require 'torch'

    if ARGV.flags._verbose? or ARGV.flags._v?
      puts "Starting Example"
    end

    puts ARGV[:important_file]

When run as `ruby test.rb -v --important_file test.txt` we get the following output:

    Starting Example
    test.txt
