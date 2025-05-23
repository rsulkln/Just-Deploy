FROM python:3.13

WORKDIR /app 

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y netcat-traditional

RUN pip install --upgrade pip 
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh


COPY . .


CMD ["./entrypoint.sh"]
