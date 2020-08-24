FROM node:14.8-buster
MAINTAINER dev@etops.ch

RUN apt-get update -q && apt-get install -qy \
    texlive-full \
    python-pygments gnuplot \
    make git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# add pgfplots latex sty files
RUN mkdir -p /usr/share/texlive/texmf-dist/tex/latex/pgf-pie
COPY styles/pgf-pie.sty /usr/share/texlive/texmf-dist/tex/latex/pgf-pie/pgf-pie.sty
# let tex scan all styles again
RUN texhash
