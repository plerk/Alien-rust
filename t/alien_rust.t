use Test2::V0 -no_srand => 1;
use Test::Alien;
use Test::Alien::Diag 1.91;
use Alien::rust;

%ENV = (%ENV, Alien::rust->env);

alien_ok 'Alien::rust';
alien_diag 'Alien::rust';

run_ok(['rustc', '--version'])
  ->success
  ->note;

run_ok(['cargo', '--version'])
  ->success
  ->note;

done_testing
