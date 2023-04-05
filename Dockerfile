FROM python:3.10.4-alpine3.15

RUN pip install --upgrade pip

RUN adduser -D brayan-gonzalez
USER brayan-gonzalez
WORKDIR /home/brayan-gonzalez

COPY --chown=brayan-gonzalez:brayan-gonzalez requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

ENV PATH="/home/brayan-gonzalez/.local/bin:${PATH}"

COPY --chown=brayan-gonzalez:brayan-gonzalez . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]