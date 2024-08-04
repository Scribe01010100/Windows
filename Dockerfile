# Windows 7 ke liye base image
FROM microsoft/windows:7

# RDP service start karna
RUN net start rdp

# RDP port expose karna
EXPOSE 3389

# RDP username, password, aur URL set karna
ENV RDP_USERNAME user
ENV RDP_PASSWORD 123456
ENV RDP_URL rdp://${RENDER_EXTERNAL_IP}:3389

# RDP connection ke liye command
CMD ["cmd.exe", "/k", "echo RDP connection string: %RDP_URL% && echo RDP username: %RDP_USERNAME% && echo RDP password: %RDP_PASSWORD%"]
