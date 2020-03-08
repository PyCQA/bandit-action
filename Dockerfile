FROM python:3.8-slim

LABEL "maintainer"="Bandit by PyCQA <code-quality@python.org>"
LABEL "repository"="https://github.com/PyCQA/bandit-action"
LABEL "homepage"="https://github.com/PyCQA/bandit-action"

RUN pip install bandit

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
