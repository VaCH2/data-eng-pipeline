echo off

setx VALUES_FILE "%cd%\confluent\helm\providers\my-values.yaml"

pause
cmd /k