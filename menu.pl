#!/usr/bin/perl

use strict;
use warnings;
use Switch;
use Socket;

my $input = '';

while ($input ne '6')
{
    clear_screen();

    print "1. Top 10 requested pages and the number of requests made for each.\n".
          "2. Percentage of successful requests (anything in the 200s and 300s range).\n". 
          "3. Percentage of unsuccessful requests (anything that is not in the 200s or 300s range).\n". 
          "4. Top 10 unsuccessful page requests.\n". 
          "5. The top 10 IPs making the most requests, displaying the IP address and number of requests made.\n".
          "6. Exit\n";

    print "Enter your choice: ";
    $input = <STDIN>;
    chomp($input);

    switch ($input)
    {
        case '1'
        {
            $input = '';

            while ($input ne '4')
            {
                clear_screen();

my $x = "access_log";

my $lc = 0;
open my $file, "<", "$x" or die $!;
$lc++ while <$file>;
close $file;

## opening access_log for parsing
open(FILE, "<access_log") or die "can't open file $!";
my @array = <FILE>;

my @counted;

my $xyz = 0;
for my $line ( @array ) 
{
	if ( $line =~ m/(?:["GET|POST]) (\S+) HTTP\/1.\d\" / ) 
    {
	    push @counted, ($1, $2);
            $xyz++;

    }
}

my %count;
 
foreach my $str (@counted) 
{
    no warnings 'uninitialized';    
    $count{$str}++;
}

print "This is a list of the top 10 most requested URLs.\n";

## We only want the 10 most requested pages.
my $iteration = 0;

foreach my $name (reverse sort { $count{$a} <=> $count{$b} } keys %count) 
{
    no warnings 'uninitialized';    
    
    if ( $iteration == 10 ) 
    { 
        last(); 
    }
    
print "$name\n";
print "[$count{$name} hits]\n";
print "####\n";

    ##printf "%-21s\n", $name;
    $iteration++;
}
print "This file had a total of  $xyz http requests.\n";
exit ();

            }

        }
        
	case '2'
        {
            $input = '';

            while ($input ne '4')
            {
                clear_screen();

my $x = "access_log";

my $lc = 0;
open my $file, "<", "$x" or die $!;
$lc++ while <$file>;
close $file;

## opening access_log for parsing
open(FILE, "<$x") or die "can't open file $!";
my @array = <FILE>;

my @counted;

my $xyz = 0;
for my $line ( @array ) 
{
	if ( $line =~ m/(?:[GET|POST]) (\S+) HTTP\/1.\d\" (2\d{2}) / ) 
    {
	    push @counted, ($1);
            $xyz++;

    }
}
my $r = ($xyz * 100);
my $y = $r / $lc;

print "This log file has [$lc] http requests.\n";

my $arrSize = @counted;
print "Of those requests, [$arrSize] were successful http requests.\n";
print "[$y%] rate of successful http requests.\n";
exit ();


            }

        }

        
	case '3'
        {
            $input = '';

            while ($input ne '4')
            {
                clear_screen();
my $x = "access_log";

my $lc = 0;
open my $file, "<", "$x" or die $!;
$lc++ while <$file>;
close $file;

## opening access_log for parsing
open(FILE, "<$x") or die "can't open file $!";
my @array = <FILE>;

my @counted;

my $xyz = 0;
for my $line ( @array ) 
{
	if ( $line =~ m/(?:[GET|POST]) (\S+) HTTP\/1.\d\" (4\d{2}) / ) 
    {
	    push @counted, ($1);
            $xyz++;

    }
}
print "This log file has [$lc] http requests.\n";
my $r = ($xyz * 100);
my $y = $r / $lc;

my $arrSize = @counted;
print "Of those requests, [$arrSize] were unsuccessful http requests.\n";
print "[$y%] rate of unsuccessful http requests.\n";
exit();

            }

            $input = '';
        }
        
	
	case '4'
        {
            $input = '';

            while ($input ne '4')
            {
                clear_screen();

my $x = "access_log";

my $lc = 0;
open my $file, "<", "$x" or die $!;
$lc++ while <$file>;
close $file;

## opening access_log for parsing
open(FILE, "<access_log") or die "can't open file $!";
my @array = <FILE>;

my @counted;

my $xyz = 0;
for my $line ( @array ) 
{
	if ( $line =~ m/(?:["GET|POST]) (\S+) HTTP\/1.\d\" (4\d{2}) / ) 
    {
	    push @counted, ($1, $2);
            $xyz++;

    }
}

my %count;
 
foreach my $str (@counted) 
{
    $count{$str}++;
}

print "This is a list of the top 10 URLs making unsuccessful http requests.\n";

## We only want the 10 most requested pages.
my $iteration = 0;

foreach my $name (reverse sort { $count{$a} <=> $count{$b} } keys %count) 
{
    no warnings 'uninitialized';    
    
    if ( $iteration == 10 ) 
    { 
        last(); 
    }
#print "\n\n";
    
#printf "%-21s %-10s\n", $name, $count{$name};
print "####\n";
print "$name\n";
print "[$count{$name} hits]\n";

    ##printf "%-21s\n", $name;
    $iteration++;
}
#print "This file has $lc lines.\n";
print "This file had $xyz unsuccessful requests.\n";
exit;

            }

            $input = '';
        }

case '4'
        {
            $input = '';

            while ($input ne '4')
            {
                clear_screen();

my $x = "access_log";

my $lc = 0;
open my $file, "<", "$x" or die $!;
$lc++ while <$file>;
close $file;

## opening access_log for parsing
open(FILE, "<access_log") or die "can't open file $!";
my @array = <FILE>;

my @counted;

my $xyz = 0;
for my $line ( @array ) 
{
	if ( $line =~ m/(?:[GET|POST]) (\S+) HTTP\/1.\d\" (4\d{2}) / ) 
    {
	    push @counted, ($1, $2);
            $xyz++;

    }
}


my %count;
 
foreach my $str (@counted) 
{
    $count{$str}++;
}

## We only want the 10 most requested pages.
my $iteration = 0;

foreach my $name (reverse sort { $count{$a} <=> $count{$b} } keys %count) 
{
    no warnings 'uninitialized';    
    
    if ( $iteration == 10 ) 
    { 
        last(); 
    }
print "\n\n";
    
print "$name\n";
print "[$count{$name} hits]\n";

    $iteration++;
}
exit;
            }

            $input = '';
        }    

case '5'
        {
            $input = '';

            while ($input ne '4')
            {
                clear_screen();

open(FILE, "<access_log") or die "can't open file $!";
my @array = <FILE>;

my @counted;

## grepping for the first string of characters in each line which is the ip
for my $line ( @array )
{
    if ( $line =~ m/^(\S+)/ )
    {
        push @counted, $1;
    }
}


my %count;

foreach my $str (@counted) {
    $count{$str}++;
}

my $iteration = 0;

foreach my $name (reverse sort { $count{$a} <=> $count{$b} } keys %count)
{
    no warnings 'uninitialized';

    if ( $iteration == 10 )
    {
        last();
    }

    ## get dns name of IP (owner)
    my $dnsname = gethostbyaddr(inet_aton($name), AF_INET);

    printf "%-21s %-10s %s\n", $name, $count{$name}, $dnsname;
    $iteration++;
}

		exit;
            }

            $input = '';
        }

}
}

exit(0);

sub clear_screen
{
    system("clear");
}

