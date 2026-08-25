@echo off
powershell -NoLogo -NoProfile -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('How are u ?','Saluto')"
