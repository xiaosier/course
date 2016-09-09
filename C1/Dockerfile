FROM ghost:0.10.0
COPY config.js /usr/src/ghost/
COPY default.hbs /usr/src/ghost/content/themes/casper/

COPY start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]