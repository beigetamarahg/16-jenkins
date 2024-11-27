# Use the official NGINX base image
FROM nginx:latest

# Copy your static website files to the default NGINX directory
COPY ./site /usr/share/nginx/html

# Expose port 80 to allow external access
EXPOSE 80

# Start the NGINX server
CMD ["nginx", "-g", "daemon off;"]

