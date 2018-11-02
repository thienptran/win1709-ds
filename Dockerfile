FROM microsoft/windowsservercore:1709

ENV chocolateyUseWindowsCompression false

SHELL ["powershell", "-Command"]

RUN Set-ExecutionPolicy Bypass -Scope Process -Force ; \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) ; \
    refreshenv

ADD artifacts/*.ps1 c:/

RUN powershell -File \
    base_software.ps1 \
    choco feature disable --name showDownloadProgress \
    refreshenv

WORKDIR /data

CMD [ "ping localhost -t" ]