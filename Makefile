giving_talks.pdf: giving_talks.tex Figs/betterfig.pdf Figs/multiimp.png
	pdflatex giving_talks
	pdflatex giving_talks

Figs/betterfig.pdf: R/colors.R R/graph_example.R
	cd R;R CMD BATCH graph_example.R

Figs/multiimp.png: R/colors.R R/imputations.R
	cd R;R CMD BATCH imputations.R
