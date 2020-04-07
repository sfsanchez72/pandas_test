#!/usr/bin/perl

open(FH,"<get_proc_elines_MaNGA.clean.csv");
$n=0;
my @a_key;
while($line=<FH>) {
    chop($line);
    $line =~ s/ //g;
    if ($line =~ "#") {
        @data=split(/\)/,$line);
        $key=$data[1];
#        print "$data[1]\n";
        $a_key[$n]=$data[1];
        $n++;
    } else {
        my @data=split(",",$line);
        $N[$k]=$#data+1;
        if ($k>0) {
            if ($N[$k]!=$N[$k-1]) {
                $I=$k-1;
                print "$k,$N[$k],$N[$I]\n";
            }
        }
        $k++;
    }
}
close(FH);
#print "$n\n"; exit;
open(OUT,">header.out");
print OUT 'col_NAMES=[';
for ($i=1;$i<$n-1;$i++) {
    print OUT "\"$a_key[$i]\",";
}
$i++;
print OUT "\"$a_key[$i]\"\]"; 
close(OUT);
exit;
