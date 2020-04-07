#!/usr/bin/perl

open(FH,"<get_proc_elines_MaNGA.clean.csv");
open(OUT,">get_proc_elines_MaNGA.no_nan.csv");
while($line=<FH>) {
    chop($line);
    if ($line !~ "#") {
        $cut="BAD";
        $nan="nan";
        $line =~ s/$cut/$nan/g;
        $cut="NaN";
        $nan="nan";
        $line =~ s/$cut/$nan/g;
#        $cut="nan";
#        $nan="-12";
#        $line =~ s/$cut/$nan/g;
        print OUT "$line\n";
    } else {
        print OUT "$line\n";
    }
}
close(OUT);
close(FH);
