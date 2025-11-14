### 1. fa2cmap_multi_color.pl
It​ is derived from Bionano Genomics' Solve v3.5​ software suite. It can simultaneously identify multiple motif sites within a genome, perform in silicocleavage at these locations, and generate a comprehensive list of fragment information.
```bash
perl fa2cmap_multi_color.pl -e Mse:TTAA 1 -e Msp:CCGG 1 -e HinP1I:GCGC 1 -i genome.fasta -o out.dir
```

### 2. find_enzyme.pl
It is a Perl script designed to process the output from the fa2cmap_multi_color.pl script, calculating the number of fragments with sequence lengths exceeding a specified threshold.
```bash
perl find_enzyme.pl wheat_AluI_MseI_MspI_0kb_0labels.cmap 300
```


### 3. find_RESite_From_Adapter.py
Check whether restriction sites of the selected enzyme are present in the adapter primers. Such primers must be avoided during library construction to prevent enzymatic cleavage of the library, which would compromise sequencing.
```bash
 python find_RESite_From_Adapter.py AdapterSeq_file  RESite_file
```
