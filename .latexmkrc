# .latexmkrc — enable shell escape only for minted

# latexmk variables are Perl scalars. %O = options, %S = source file.

# Always use pdflatex
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';

# Default output directory
$out_dir = 'build';

# Detect if the document uses the "minted" package
my $uses_minted = 0;
open my $texfile, '<', 'main.tex' or return;
while (<$texfile>) {
  if (/\\usepackage.*\{minted\}/) {
    $uses_minted = 1;
    last;
  }
}
close $texfile;

# Enable shell-escape only when minted is used
if ($uses_minted) {
  $pdflatex = 'pdflatex -shell-escape -interaction=nonstopmode -synctex=1 %O %S';
  print "⚙️  Detected minted — enabling -shell-escape\n";
}

# Clean auxiliary files produced by minted
@generated_exts = qw(aux bbl blg fls fdb_latexmk log out toc synctex.gz pyg);

# Optional: ensure we build PDF only
$pdf_mode = 1;
