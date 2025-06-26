# ✅ Base Rasa SDK Image
FROM rasa/rasa:3.6.10

# ✅ Set working directory
WORKDIR /app

# ✅ Copy all project files
COPY . /app

# ✅ Install additional dependencies (if needed)
# Uncomment if you have a custom actions server
RUN pip install -r requirements.txt

# ✅ Default Rasa run command (REST API enabled)
CMD ["run", "--enable-api", "--port", "5005", "--cors", "*"]
