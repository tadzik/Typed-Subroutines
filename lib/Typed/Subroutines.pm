module Typed::Subroutines;

sub typed_sub(*@types) is export {
    return sub ($s) {
        $s.signature.params == +@types
        and @types ~~ $s.signature.params.map(*.type)
    }
}

=begin pod

=head1 SYNOPSIS

    use Typed::Subroutines;
    subset TwoArgSub         of Sub where typed_sub(Any, Any);
    subset TakesIntAndString of Sub where typed_sub(Int, Str);

    my TwoArgSub         $a;
    my TakesIntAndString $b;

    $a = sub ($a, $b) { ... }; # lives
    $a = sub ($a)     { ... }; # dies

    $b = sub (Int $a, Str $b) { ... }; # lives
    $b = sub (Int $a,     $b) { ... }; # dies

=head1 DESCRIPTION

Typed::Subroutines let you specify subroutine types verifying the
parameter list so you can have better type checking for
first-class functions.

I'll write more docs when I'm less tired.

=end pod
