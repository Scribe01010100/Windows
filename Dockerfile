# Yeh Windows base image le raha hai, jo Docker ke liye suitable hai.
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# RDP ko enable karne ke liye PowerShell command use karte hain
RUN powershell -Command "Set-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server' -name 'fDenyTSConnections' -value 0"

# RDP port expose karna
EXPOSE 3389

# RDP username aur password set karna
ENV RDP_USERNAME user
ENV RDP_PASSWORD 123456

# Aap RDP_URL ko build time pe pass kar sakte hain
ARG RDP_URL
ENV RDP_URL=${RDP_URL}

# RDP connection ke liye command
CMD ["cmd.exe", "/k", "echo RDP connection string: %RDP_URL% && echo RDP username: %RDP_USERNAME% && echo RDP password: %RDP_PASSWORD%"]
