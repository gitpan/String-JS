package String::JS;

our $DATE = '2014-07-25'; # DATE
our $VERSION = '0.01'; # VERSION

use 5.010001;
use strict;
use warnings;

use JSON;
my $json = JSON->new->allow_nonref;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       encode_js_string
                       decode_js_string
               );

sub encode_js_string {
    my $str = shift;
    no warnings 'uninitialized'; # shut up warning when $str is undef
    $json->encode("$str");
}

sub decode_js_string {
    my $str = shift;
    if ($str =~ /\A"/o) {
        $json->decode($str);
    } elsif ($str =~ /\A'/o) {
        die "Decoding JavaScript string with single quotes not yet implemented";
    } else {
        die "Invalid JavaScript string literal";
    }
}

1;
# ABSTRACT: Utilities for Javascript string literal representation

__END__

=pod

=encoding UTF-8

=head1 NAME

String::JS - Utilities for Javascript string literal representation

=head1 VERSION

This document describes version 0.01 of String::JS (from Perl distribution String-JS), released on 2014-07-25.

=head1 FUNCTIONS

=head2 encode_js_string($str) => STR

Encode Perl string C<$str> to its JavaScript literal representation using double
quotes (C<">). This is currently implemented using JSON encoding.

An option to produce literal representation using single quotes (C<'>) will be
provided in the future.

Will die on failure.

=head2 decode_js_string($js_str) => STR

Given a JavaScript string literal representation in C<$js_str>, decode to get
the value.

Currently implemented using JSON decoding of stringified C<$js_str>.

Currently does not support JavaScript string representation that uses single
quotes (C<'>).

Will die on failure.

=head1 SEE ALSO

L<JSON>

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/String-JS>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-String-JS>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=String-JS>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
