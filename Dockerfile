FROM ubuntu:14.04
MAINTAINER Mark Dunning<mark.dunning@cruk.cam.ac.uk>
RUN sudo apt-get update
RUN sudo apt-get install -y git r-base
RUN git clone https://github.com/bioinformatics-core-shared-training/IntroductionToStats.git
RUN Rscript -e 'install.packages(c("Rcmdr"),repos="http://cran.rstudio.com")'