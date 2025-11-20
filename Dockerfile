FROM python:3.12

ENV PYTHONUNBUFFERED 1

ENV ENV DJANGO_SETTINGS_MODULE myproject.settings

WORKDIR /usr/src/app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "myproject.wsgi:application"]