# Alien::rust [![Build Status](https://secure.travis-ci.org/plicease/Alien-rust.png)](http://travis-ci.org/plicease/Alien-rust)

Find or download Rust compiler

# SYNOPSIS

    use Alien::rust;
    use Env qw( @PATH );
    %ENV = (%ENV, Alien::rust->env);
    unshift @PATH, Alien::rust->bin_dir;
    system 'cargo', 'build';

# DESCRIPTION

This Alien will find or download the rust compiler for use in your Perl scripts
and modules.  It can be used as a dependency in CPAN.

# METHODS

## bin\_dir

    my @dirs = Alien::rust->bin_dir;

Returns the directories, if any, that need to be added to the PATH in order to
invoke the rust compiler or cargo.

## env

    my %env = Alien::rust->env;

Returns the environment variables that need to be set or overridden.
The idiom

    %ENV = (%ENV, Alien::rust->env);

is probably helpful.

## dynamic\_libs

    my @libs = Alien::rust->dynamic_libs;

Not used.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2019 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
