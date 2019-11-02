package Alien::rust;

use strict;
use warnings;
use 5.008001;
use base qw( Alien::Base );

# ABSTRACT: Find or download Rust compiler
# VERSION

=head1 SYNOPSIS

 use Alien::rust;
 use Env qw( @PATH );
 %ENV = (%ENV, Alien::rust->env);
 unshift @PATH, Alien::rust->bin_dir;
 system 'cargo', 'build';

=head1 DESCRIPTION

This Alien will find or download the rust compiler for use in your Perl scripts
and modules.  It can be used as a dependency in CPAN.

=head1 METHODS

=head2 bin_dir

 my @dirs = Alien::rust->bin_dir;

Returns the directories, if any, that need to be added to the PATH in order to
invoke the rust compiler or cargo.

=cut

sub bin_dir
{
  my($class) = @_;
  if($class->install_type('share'))
  {
    return (File::Spec->catdir($class->dist_dir, 'cargo', 'bin'));
  }
  else
  {
    return ();
  }
}

=head2 env

 my %env = Alien::rust->env;

Returns the environment variables that need to be set or overridden.
The idiom

 %ENV = (%ENV, Alien::rust->env);

is probably helpful.

=cut

sub env
{
  my($class) = @_;
  if($class->install_type('share'))
  {
    my $dist_dir = $class->dist_dir;
    return (
      CARGO_HOME => File::Spec->catdir($dist_dir, 'cargo'),
      RUSTUP_HOME => File::Spec->catdir($dist_dir, 'rustup'),
    );
  }
  else
  {
    return ();
  }
}

=head2 dynamic_libs

 my @libs = Alien::rust->dynamic_libs;

Not used.

=cut

sub dynamic_libs
{
  return ();
}


1;
