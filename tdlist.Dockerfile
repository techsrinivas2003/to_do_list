# Use the latest Python image (assuming Python 3.13 is available or close to it)
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt --verbose

# Copy the rest of the application code
COPY . .

# Expose the port the app will run on (Flask default is 5000)
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
