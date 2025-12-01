FROM texlive/texlive:latest
COPY entrypoint.sh /entrypoint.sh
COPY .latxmkrc /.latexmkrc
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT [ "/entrypoint.sh" ]
