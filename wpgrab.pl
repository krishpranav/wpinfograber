#!/usr/bin/perl

use if $^O eq "MSWin32", Win32::Console::ANSI;
use Term::ANSIColor;
use LWP::UserAgent;
use HTTP::Request::Common qw(GET);
use URI::URL;
use Getopt::Long;

$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->timeout (10);

GetOptions(
    "u=s" => \$site,
);

unless ($site) { help(); }
if ($site) { banner(); }


sub banner() {
print q(
    WPINFOGRABBER
);
  print color('bold red')," [";
  print color('bold green'),"+";
  print color('bold red'),"] ";
  print color('bold white'),"$site\n";
  user();
  Version();
  Theme();
  Plugin();
}

sub help(){
print color('bold white'), " Usage perl wpgrab.pl -u http://website.com"
}