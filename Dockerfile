# Use the official NGINX base image
FROM nginx:latest

COPY ./site /usr/share/nginx/html

# Expose port 80 to allow external access
EXPOSE 80

# Start the NGINX server
CMD ["nginx", "-g", "daemon off;"]

