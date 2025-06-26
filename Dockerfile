FROM rasa/rasa:3.6.10

# Set working directory
WORKDIR /app

# Copy your Rasa project into the container
COPY . .

# Switch to root to install packages
USER root

# Install Python dependencies
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Switch back to non-root for security
USER 1001

# Expose the port
EXPOSE 5005

# ✅ Final working CMD
CMD ["run", "--enable-api", "--cors", "*", "--debug"]
