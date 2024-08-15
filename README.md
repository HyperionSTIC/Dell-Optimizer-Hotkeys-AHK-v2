# Dell-Optimizer-Hotkeys-AHK-v2
Contains the AutoHotKey v2.0 script needed to use HotKeys to change Dell Optimizer Thermal Management Modes.

This is useful for Dell Latitude Systems
> [!IMPORTANT]
> This script is required to be started as an Administrator, or else Dell Optimizer CLI `do-cli.exe` will not be able to apply settings.
> 
> `do-cli.exe` can be found at `"C:\Program Files\Dell\DellOptimizer\do-cli.exe"`, Standard Installation path for Dell Optimizer


> [!TIP]
> There's a guide below to help you start the script as Administrator via Task Scheduler when logged on (Makes life much easier!!)

## Usage Instructions
> [!IMPORTANT]
> Install [AutoHotKey v2](https://www.autohotkey.com/)
> 
> Download the script I've made.

Ctrl + Shift + Alt + 1 to 4 (top number row)

- 1 - Optimized
- 2 - Cool
- 3 - Quiet
- 4 - Ultra

## Customize your HotKeys

If you want to change the Hotkeys Take a look at [HotKey Modifier Symbols](https://www.autohotkey.com/docs/v2/Hotkeys.htm#Symbols)
- Shift is +
- Ctrl is ^
- Alt is !
- Win key is Win

An example - Say you want to use Shift + O for Optimized mode, in the script, you need to change `^+!1::` to `+O::`

```
^+!1::
{
run "cmd.exe /k`"C:\Program Files\Dell\DellOptimizer\do-cli.exe`" /configure -name=SystemPowerConfiguration.ThermalMode -value=Optimized",, "Hide"
}
```
Changes to this
```
+O::
{
run "cmd.exe /k`"C:\Program Files\Dell\DellOptimizer\do-cli.exe`" /configure -name=SystemPowerConfiguration.ThermalMode -value=Optimized",, "Hide"
}
```

## Setting it up to work after a System boot with admin

- Open Task Scheduler `Win + R > taskschd.msc`
- Select `Create New Task`
- General Tab
  - Name it whatever you like, I have named it as `DellOptimizerThermalMode`
  - Description if needed.
  - Make sure your Admin user account is selected under `Security Options`
  - Tick the following
    - `Run when only when user is logged on`
    - `Run with highest privilages`
    - `Hidden`
    - Configure for: `Windows 10`
- Triggers Tab
  - Click `New`
  - Select from the top dropdown list, `At Startup`
  - Tick `Enabled`
- Actions Tab
  - Click `New`
  - Action `Start a Program`
  - Select `Browse`. Select the AHK script I made
  - Select `Ok`
- Conditions Tab
  - Uncheck everything here
- Settings Tab
  - Select `Allow Task to be run on demand`
  - Uncheck everything else here
  - Select `Ok`

- A prompt appears and type in your Windows Password (Not Windows Hello pin or password)

And we are done!!
