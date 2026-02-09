FROM docker.io/library/python:3.12-slim

# Install packages via pip
WORKDIR /app
ENV PIP_BREAK_SYSTEM_PACKAGES=1
RUN python3 -m pip install \
  --root-user-action ignore \
  --no-cache-dir \
  piper-tts \
  pathvalidate \
;
# RUN pip3 install 'flask>=3,<4' # do I need this?/s

# Download a default voice
# python3 -m piper.download_voices  # List voices
RUN python3 -m piper.download_voices en_US-lessac-medium

ENTRYPOINT ["python3", "-m", "piper", "-m", "en_US-lessac-medium"]
