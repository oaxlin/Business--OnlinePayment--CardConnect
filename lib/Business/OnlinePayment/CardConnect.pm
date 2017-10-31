package CardConnect;
use warnings;
use strict;

use Business::OnlinePayment;
use Business::OnlinePayment::HTTPS;
use vars qw(@ISA $me $DEBUG);
use MIME::Base64;
use HTTP::Tiny;
use Business::CreditCard qw(cardtype);
use Data::Dumper;
use IO::String;
use Carp qw(croak);
use Log::Scrubber qw(disable $SCRUBBER scrubber :Carp scrubber_add_scrubber);

@ISA     = qw(Business::OnlinePayment::HTTPS);
$me      = 'Business::OnlinePayment::Litle';
$DEBUG   = 0;
# VERSION

# PODNAME: Business::OnlinePayment::CardConnect

# ABSTRACT: Business::OnlinePayment::CardConnect - CardConnect Backend for Business::OnlinePayment

=head1 SYNOPSIS

This is a plugin for the Business::OnlinePayment interface.  Please refer to that documentation for general usage, and here for CardConnect specific usage.

In order to use this module, you will need to have an account set up with CardConnect L<https://cardconnect.com>

  use Business::OnlinePayment;
  my $tx = Business::OnlinePayment->new("CardConnect");

  $tx->content(
      type           => 'CC',
      login          => 'testdrive',
      password       => '123qwe',
      action         => 'Normal Authorization',
      description    => 'FOO*Business::OnlinePayment test',
      amount         => '49.95',
      customer_id    => 'tfb',
      name           => 'Tofu Beast',
      address        => '123 Anystreet',
      city           => 'Anywhere',
      state          => 'UT',
      zip            => '84058',
      card_number    => '4007000000027',
      expiration     => '09/02',
      cvv2           => '1234', #optional
      invoice_number => '54123',
  );
  $tx->submit();

  if($tx->is_success()) {
      print "Card processed successfully: ".$tx->authorization."\n";
  } else {
      print "Card was rejected: ".$tx->error_message."\n";
  }

=head1 METHODS AND FUNCTIONS

=cut


1;
