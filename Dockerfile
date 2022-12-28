# FROM python:3.11-alpine
# FROM python:3.10
# FROM python:latest

# LABEL author="youban.uprety@outcodesoftware.com"

# RUN apk add --no-cache --virtual .build-deps gcc g++ libc-dev libffi-dev openssl-dev \
#     build-base bsd-compat-headers make cmake musl-dev python3-dev cargo \
#     && python3 -m pip install --upgrade pip \
#     --no-cache-dir --no-color --no-python-version-warning --disable-pip-version-check \
#     && apk del .build-deps gcc libc-dev make

# COPY ./start.sh /start.sh
# RUN chmod +x /start.sh
#
# COPY ./start-reload.sh /start-reload.sh
# RUN chmod +x /start-reload.sh
#
# COPY ./requirements.txt /requirements.txt
# RUN  python3 -m pip install -r requirements.txt
#
# COPY ./hypercorn_conf.py /hypercorn_conf.py
#
# COPY ./app /app
#
# WORKDIR /app
# ENV PYTHONPATH=/app
#
# EXPOSE 80
# EXPOSE 443

#CMD ["/start.sh"]


# FROM python:3.9
#
# LABEL author="bynect <bynect@gmail.com>"
#
# RUN python3 -m pip install uvicorn[standard] fastapi pymongo \
#     --no-cache-dir --no-color --no-python-version-warning --disable-pip-version-check

# COPY ./start.sh /start.sh
# RUN chmod +x /start.sh
#
# COPY ./start-reload.sh /start-reload.sh
# RUN chmod +x /start-reload.sh

# COPY ./hypercorn_conf.py /hypercorn_conf.py

# COPY ./app /app
#
# WORKDIR /app
# ENV PYTHONPATH=/app
#


# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
# EXPOSE 443

# CMD ["/start.sh"]

FROM tiangolo/uvicorn-gunicorn:python3.11


COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt
EXPOSE 80
COPY ./app /app