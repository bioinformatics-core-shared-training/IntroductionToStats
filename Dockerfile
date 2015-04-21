FROM centos:centos7
MAINTAINER Mark Dunning<mark.dunning@cruk.cam.ac.uk>

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm && \
    yum install -y git ed tar R libpng-devel mesa-libGL-devel mesa-libGLU-devel NLopt-devel

RUN Rscript -e 'install.packages(c("Rcmdr","XLConnect","XLConnectJars","rJava","sem","relimp","multcomp","markdown","lmtest","leaps","knitr","effects","aplpack","matrixcalc","mvtnorm","TH.data","mime","evaluate","formatR","highr","rgl"),repos="http://cran.rstudio.com")'

RUN useradd -g users -m rcmdr
ENV HOME /home/rcmdr
USER rcmdr
RUN cd $HOME && git clone https://github.com/bioinformatics-core-shared-training/IntroductionToStats.git
CMD /usr/bin/R