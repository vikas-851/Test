FROM nikolaik/python-nodejs:python3.10-nodejs19

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ffmpeg \
        bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app/

# Copy the requirements file and install Python dependencies
COPY requirements.txt /app/
RUN pip3 install --upgrade pip \
    && pip3 install --no-cache-dir --requirement requirements.txt

# Copy the rest of the application code
COPY . /app/

# Set the default command
CMD ["bash", "start"]
