# Dell-Optimizer-Hotkeys-AHK-v2
Contains the AutoHotKey v2.0 script needed to use HotKeys to change Dell Optimizer Thermal Management Modes.

This is useful for Dell Latitude Systems
> [!IMPORTANT]
> This script is required to be started as an Administrator, or else Dell Optimizer CLI `do-cli.exe` will not be able to apply settings.
> 
> `do-cli.exe` can be found at `"C:\Program Files\Dell\DellOptimizer\do-cli.exe"`, Standard Installation path for Dell Optimizer
> 
> Sadly there is no popup to alert you if you have switched modes, but it works every single time I've checked!!


> [!TIP]
> There's a guide below to help you start the script as Administrator via Task Scheduler when logged on (Makes life much easier!!)

## Usage Instructions
> [!IMPORTANT]
> Install [AutoHotKey v2](https://www.autohotkey.com/). Install it for `All users` in the setup.
> 
> Download the script I've made from [Releases](https://github.com/HyperionSTIC/Dell-Optimizer-Hotkeys-AHK-v2/releases)
>
> Place it wherre you prefer!! Remember the location of the file, this will be needed to start the script as Administrator on login!!

Ctrl + Shift + Alt + 1 to 4 (top number row)

- 1 - Optimized
- 2 - Cool
- 3 - Quiet
- 4 - Ultra

## Customize your HotKeys

You can use Notepad or whatever editor you use to edit text files and scripts

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
  - Select from the top dropdown list, `At log on of any user`
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
  - Select, if the task fails, restart every `1 minute`
  - Select, Attempt to restart up to `3 times`
  - Uncheck everything else here
  - Select `Ok`

- A prompt appears and type in your Windows Password (Not Windows Hello pin or password)

And we are done!!

## Resources I've used

- [Dell Optimizer Version 4.0 User's Guide](https://www.dell.com/support/manuals/en-us/dell-optimizer/dell-optimizer-4.0_ug/command-line-interface-for-dell-optimizer?guid=guid-a82481c9-8abf-4a15-9f2b-6011e36c6b19&lang=en-us)
