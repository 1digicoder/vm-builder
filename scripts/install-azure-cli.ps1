#install azure cli
pip install --user azure-cli
#install the environment variable for Azure CLI
[Environment]::SetEnvironmentVariable("Path", "$env:Path;$env:appdata\Python\Python36\Scripts\", "User")