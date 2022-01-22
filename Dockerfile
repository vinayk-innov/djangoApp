FROM python:3.9
# base image to be used

# The environment variable ensures that the python output is set 
#straight to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /code

# add the requirements file to the working dir
COPY requirements.txt /code/

#install the requirements (install before adding rest of code to #avoid rerunning this at every code change-built in layers)
RUN pip3 install -r requirements.txt

# Copy the current directory contents into the container at /code/
COPY . /code/

#set environment vars to be used
ENV AUTHOR="Vinay"
#port from the container to expose to host
EXPOSE 8000
#Tell image what to do when it starts as a container
RUN chmod +x /code/start.sh

CMD /code/start.sh


# WORKDIR /usr/src/app

# # We copy just the requirements.txt first to leverage Docker cache
# COPY ./requirements.txt ./

# RUN pip install --upgrade pip
# RUN pip install --no-cache-dir -r requirements.txt

# # Let' only copy the required files and folders
# ADD . ./
# COPY . ./

# EXPOSE 8000

# CMD ["python3", "manage.py", "runserver" ]
