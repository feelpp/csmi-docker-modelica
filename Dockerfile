FROM ghcr.io/feelpp/om:jammy-stable

RUN apt update -qq && apt install -y python3-pip && pip3 install fmpy flask
RUN pip3 install plotly dash dash_bootstrap_components

COPY . /app
WORKDIR /app
RUN omc  --fmiFlags=s:cvode Lorenz.mos
RUN ls -l
CMD [ "python3", "-m", "fmpy.webapp","lorenz.fmu","--port","31000"]
EXPOSE 31000