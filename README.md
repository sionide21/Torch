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

There are several ways to see the command line flags depending on what you are trying to do. 
Here are examples of various methods available for a program invoked with the arguments `-v -xzf red.tgz`: 

    ARGV                           => ["-v", "-xzf", "red.tgz"]
    ARGV.flags                     => ["v", "x", "z", "f"]

To test presence of an argument:

    ARGV.flags.include?(:v)        => true
    ARGV.flags._v?                 => true
    ARGV.flags.include?(:env)      => false
    ARGV.flags._env?               => false

Notice that you can use `_opt?` as a shortcut to `include?`. The _ is to prevent conflicts with built in methods.
If your flag names are too complex to be accessed as a method, you can still use `include? string`:

    ARGV.flags.include?('complex-fl@g')      => false

You can get arguments to an option by treating ARGV as a hash:

    ARGV[:env]                     => nil
    ARGV[:v]                       => nil
    ARGV[:x]                       => "red.tgz"
    ARGV[:z]                       => "red.tgz"
    ARGV[:f]                       => "red.tgz"

Notice that since we passed `-xzf red.tgz`, we show "red.tgz" as the argument to x, z, and f.
It is up to your program to decide how to handle that.

You can access a list of arguments without flags by calling the `args` method:

    ARGV.args                      => ["red.tgz"]

Currently, option arguments (like "red.tgz") will be in this list. That is because Torch
doesn't know whether you meant a given flag to take an arg.
