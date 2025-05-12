FROM nginx:alpine

# Copy custom configuration file if needed
# COPY nginx.conf /etc/nginx/nginx.conf

# Copy website content to default nginx public folder
COPY . /usr/share/nginx/html

# Expose ports
EXPOSE 80
