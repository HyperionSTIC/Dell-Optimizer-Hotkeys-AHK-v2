#Requires AutoHotkey v2.0

#SingleInstance force
^+!1::
{
run "cmd.exe /k`"C:\Program Files\Dell\DellOptimizer\do-cli.exe`" /configure -name=SystemPowerConfiguration.ThermalMode -value=Optimized",, "Hide"
}

^+!2::
{
run "cmd.exe /k`"C:\Program Files\Dell\DellOptimizer\do-cli.exe`" /configure -name=SystemPowerConfiguration.ThermalMode -value=Cool",, "Hide"
}

^+!3::
{
run "cmd.exe /k`"C:\Program Files\Dell\DellOptimizer\do-cli.exe`" /configure -name=SystemPowerConfiguration.ThermalMode -value=Quiet",, "Hide"
}

^+!4::
{
run "cmd.exe /k`"C:\Program Files\Dell\DellOptimizer\do-cli.exe`" /configure -name=SystemPowerConfiguration.ThermalMode -value=Ultra",, "Hide"
}