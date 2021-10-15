unit Logs;

{$mode objfpc}{$H+}

interface

uses
  RaspberryPi,
  GlobalConfig,
  GlobalConst,
  Platform,
  Threads,
  Classes,
  Console,
  Devices,
  Serial,
  I2C,
  SysUtils,
  Ultibo;

var
   Debug : integer;

procedure Log(message: string);
procedure LogLn(message: string);
procedure LogInit();



implementation


procedure Log(message: string);
   begin
     Write(message);

   end;

procedure LogLn(message: string);
   begin
     WriteLn(message);

   end;

procedure LogInit();
   begin
        if SerialOpen(9600,SERIAL_DATA_8BIT,SERIAL_STOP_1BIT,SERIAL_PARITY_NONE,SERIAL_FLOW_NONE,0,0) = ERROR_SUCCESS then
             begin
                  SerialDeviceRedirectOutput(SerialDeviceGetDefault);
                  LogLn('Serial open');
             end;
     //ConsoleDeviceSetDefault(ConsoleDeviceFindByDevice(DeviceFindByDescription('SERIAL')));
     LogLn('Logs initializing');
     MillisecondDelay(100);
   end;


end.

