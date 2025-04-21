FROM nginx:alpine

# Remove the default Nginx web files
RUN rm -rf /usr/share/nginx/html/*

# Copy your custom site into the default nginx path
COPY . /usr/share/nginx/html

EXPOSE 80

