#Descarga la imagen nginx la version latest
FROM nginx
LABEL maintainer="NGINX Docker Maintainers"
VOLUME /usr/share/nginx/html
VOLUME /etc/nginx
#Copia toda la configuracion necesaria del nginx hacia la /etc/nginx donde se exponen los puertos del backend internamente
COPY /home/Narayan/Desktop/retotecnicoAgileOps/nginx_configuration/nginx /etc/nginx/
COPY --from=build /app/build /usr/share/nginx/html
#Para que se guarden los logs del nginx para el respectivo troubleshooting
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
EXPOSE 80
CMD ["nginx"]
