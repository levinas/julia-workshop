
$n = 9999;

for $i (1..$n) {
    for $j (1..$n) {
        $total += $i/$j;
    }
}

print "$total\n";
