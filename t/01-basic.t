use Test;
plan 9; # from outer space

use Typed::Subroutines;

subset TwoArgSub of Sub where typed_sub(Any, Any);

my TwoArgSub $a;

lives_ok { $a = sub ($a, $b)     { } }, 'lives 1';
dies_ok  { $a = sub ()           { } };
dies_ok  { $a = sub ($a)         { } };
dies_ok  { $a = sub ($a, $b, $c) { } };

subset TakesIntAndString of Sub where typed_sub(Int, Str);

my TakesIntAndString $b;

lives_ok { $b = sub (Int $a, Str $b)     { } }, 'lives 2';
dies_ok  { $b = sub (Int $a, $b)         { } };
dies_ok  { $b = sub ($a, Str $b)         { } };
dies_ok  { $b = sub (Str $a, Int $b)     { } };
dies_ok  { $b = sub (Int $a, Str $b, $c) { } };
