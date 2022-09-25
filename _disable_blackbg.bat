FOR /R "%~dp0_ark\ps3\world" %%f in (*) do DEL %%f
rd "%~dp0_ark\ps3\world\world_01"
rd "%~dp0_ark\ps3\world\world_02"
rd "%~dp0_ark\ps3\world\world_03"
rd "%~dp0_ark\ps3\world\shared\fx"
rd "%~dp0_ark\ps3\world\shared\geo"
rd "%~dp0_ark\ps3\world\shared\shaders"
rd "%~dp0_ark\ps3\world\shared"
rd "%~dp0_ark\ps3\world"
pause