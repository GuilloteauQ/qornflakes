
all: slides.pdf

slides.pdf: slides/main.Rmd
	Rscript -e 'rmarkdown::render("slides/main.Rmd", "qprez::qprez")'
