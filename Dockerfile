FROM python:3.11.0b1-buster

# set work directory
WORKDIR /app


# dependencies for psycopg2
RUN |
sudo apt-get update 
sudo apt-get install --no-install-recommends -y dnsutils=1:9.11.5.P4+dfsg-5.1+deb10u7 libpq-dev=11.16-0+deb10u1 python3-dev=3.7.3-1 \
sudo apt-get clean \
sudo rm -rf /var/lib/apt/lists/*


# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# Install dependencies
RUN python -m pip install --no-cache-dir pip==22.0.4
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


# copy project
COPY . /app/


# install pygoat
EXPOSE 8000


RUN python3 /app/manage.py migrate
WORKDIR /app/pygoat/
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers","6", "pygoat.wsgi"]

#-------------------------------BY PHIND.COM---------------------------------------------------------------
# FROM python:3.11.0b1-buster

# # Set work directory
# WORKDIR /app

# # Manually install specific versions of dependencies for dnsutils
# # Replace 'package1.deb', 'package2.deb', etc., with the actual .deb files for your dependencies
# # Make sure to download these .deb files and place them in the same directory as your Dockerfile
# COPY ./libbind9-161.deb ./libdns1104.deb ./libisc1100.deb ./libisccfg163.deb ./liblwres161.deb ./

# RUN dpkg -i libbind9-161.deb libdns1104.deb libisc1100.deb libisccfg163.deb liblwres161.deb && \
#     apt-get install -fy

# # Install dnsutils with the specific version
# RUN apt-get update && apt-get install --no-install-recommends -y dnsutils=1:9.11.5.P4+dfsg-5.1+deb10u7

# # Continue with your original Dockerfile setup
# RUN apt-get install --no-install-recommends -y libpq-dev=11.16-0+deb10u1 python3-dev=3.7.3-1

# RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Install dependencies
# RUN python -m pip install --no-cache-dir pip==22.0.4
# COPY requirements.txt requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy project
# COPY . /app/

# # Install pygoat
# EXPOSE 8000

# RUN python3 /app/manage.py migrate
# WORKDIR /app/pygoat/
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers","6", "pygoat.wsgi"]

# ----------------------------------------BY NANUCHI'S REPO------------------------------------------------------------

# FROM python:3.11.0b1-buster

# # set work directory
# WORKDIR /app


# # dependencies for psycopg2
# RUN apt-get update && apt-get install --no-install-recommends -y dnsutils=1:9.11.5.P4+dfsg-5.1+deb10u9 libpq-dev=11.16-0+deb10u1 python3-dev=3.7.3-1 \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/*


# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1


# # Install dependencies
# RUN python -m pip install --no-cache-dir pip==22.0.4
# COPY requirements.txt requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt


# # copy project
# COPY . /app/


# # install pygoat
# EXPOSE 8000


# RUN python3 /app/manage.py migrate
# WORKDIR /app/pygoat/
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers","6", "pygoat.wsgi"]
