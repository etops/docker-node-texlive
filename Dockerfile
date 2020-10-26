FROM node:14.14-buster-slim
LABEL MAINTAINER="dev@etops.ch"

RUN apt-get update -q && apt-get install -qy \
    texlive-full \
    python-pygments gnuplot \
    make git \
    && apt-get autoremove --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# set latex memory limits
# RUN echo "\nmain_memory = 12000000" >> /usr/src/texcnf/texmf.cnf \
#     && echo "\nextra_mem_bot = 12000000" >> /usr/src/texcnf/texmf.cnf \
#     && echo "\nfont_mem_size = 12000000" >> /usr/src/texcnf/texmf.cnf \
#     && echo "\npool_size = 12000000" >> /usr/src/texcnf/texmf.cnf \
#     && echo "\nbuf_size = 12000000" >> /usr/src/texcnf/texmf.cnf \
#     && export TEXMFCNF=/usr/src/texcnf:

# add pgfplots latex sty files
RUN mkdir -p /usr/share/texlive/texmf-dist/tex/latex/pgf-pie
COPY styles/pgf-pie.sty /usr/share/texlive/texmf-dist/tex/latex/pgf-pie/pgf-pie.sty
# let tex scan all styles again
RUN texhash
