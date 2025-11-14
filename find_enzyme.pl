#!/usr/bin/perl -w
use strict;

die "UASE:\tperl $0 cmap min\n" unless @ARGV==2;

open (IN,"$ARGV[0]")or die $!;
my %info;
my ($chr,$weizhi);
my $length;

while(<IN>){
	chomp;
	next if /^#/;
	($chr,$weizhi)=(split/\t/,$_)[0,5];
	$info{$chr}.="$weizhi\t";
}

my $num;
my @xinxi;

open (OUT,">$ARGV[0]_enzyme_$ARGV[1]_info");
my @key=sort {$a<=>$b} keys %info;
foreach $chr(@key){
	@xinxi=(split/\t/,$info{$chr});
	for(my $i=0;$i<@xinxi-1;$i++){
		$length=$xinxi[$i+1]-$xinxi[$i];
		if ($length>$ARGV[1]){
			$num++;
			print OUT "$chr\t$xinxi[$i]\t$xinxi[$i+1]\t$length\n";
		} 
	}
}	
