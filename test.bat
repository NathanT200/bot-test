Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class MouseControl {
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int X, int Y);

    [DllImport("user32.dll")]
    public static extern void mouse_event(int dwFlags, int dx, int dy, int dwData, int dwExtraInfo);

    public const int MOUSEEVENTF_LEFTDOWN = 0x02;
    public const int MOUSEEVENTF_LEFTUP = 0x04;
}
"@

# Coordonnées où déplacer la souris
$x = 300  # Remplacez par votre coordonnée X
$y = 150  # Remplacez par votre coordonnée Y

# Déplacer la souris
[MouseControl]::SetCursorPos($x, $y)

# Effectuer un clic gauche
Start-Sleep -Milliseconds 500  # Pause pour assurer que le déplacement est terminé
[MouseControl]::mouse_event([MouseControl]::MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
Start-Sleep -Milliseconds 100  # Pause pour simuler un clic naturel
[MouseControl]::mouse_event([MouseControl]::MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
