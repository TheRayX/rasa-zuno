FROM rasa/rasa:3.6.10

# Set working directory
WORKDIR /app

# Copy all project files into container
COPY . .

# ✅ Switch to root to install packages
USER root

# ✅ Fix permission error by using --no-cache-dir and upgrading pip
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# ✅ (Optional) If safetensors is still causing problems, pin it:
# RUN pip install safetensors==0.3.1

# ✅ Switch back to non-root user (as required by Render security)
USER 1001

# ✅ Expose the default Rasa port
EXPOSE 5005

# ✅ Start Rasa server with API and CORS
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--debug"]
