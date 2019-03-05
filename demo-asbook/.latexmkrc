$out_dir = 'out/';
$aux_dir = 'int/';

if ($^O =~ m/MSWin/ || $^O eq 'dos' || $^O eq 'Cygwin')
{
  $ENV{'TEXINPUTS'}='../;int/;out/;';
  $ENV{'BSTINPUTS'}='../;int/;out/;';
  $ENV{'OPENTYPEFONTS'}='.;../;';
  $ENV{'TTFONTS'}='.;../;';
} else {
  $ENV{'TEXINPUTS'}='../:int/:out/:';
  $ENV{'BSTINPUTS'}='../:int/:out/:';
  $ENV{'OPENTYPEFONTS'}='.:../:';
  $ENV{'TTFONTS'}='.:../:';
}

$bibtex_fudge=0;
# force using xelatex
# $pdf_mode=1;
# $pdflatex="xelatex %O %P";

# use xelatex - xdv -> pdf - not working due to bugs in 4.61
$pdf_mode=5;
&alt_tex_cmds;

# experimental
# $pre_tex_code='\providecommand{\setstage}{gold}';
# $jobname="thesis-gold";

@default_files = ('thesis');
