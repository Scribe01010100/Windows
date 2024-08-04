# Windows Server base image use kar rahe hain
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# RDP ko enable karne ke liye PowerShell command use kar rahe hain
RUN powershell -Command "Set-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server' -name 'fDenyTSConnections' -value 0"

# RDP port expose karna
EXPOSE 3389

# Windows user create karna
RUN net user user admin /add && net localgroup administrators user /add

# RDP connection ke liye command
CMD ["cmd.exe", "/k", "echo RDP connection string: %RDP_URL% && echo RDP username: user && echo RDP password: admin"]
