me lo fai scaivabile ? import javax.swing.JOptionPane;
import java.net.InetAddress;
import java.net.UnknownHostException;

public class SystemInfoWelcome {
    public static void main(String[] args) {
        // System Information
        String username = System.getProperty("user.name");
        String osName = System.getProperty("os.name");
        String osVersion = System.getProperty("os.version");
        String osArch = System.getProperty("os.arch");
        
        String hostname;
        try {
            hostname = InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException e) {
            hostname = "Unknown Host";
        }

        // Build Info Display
        StringBuilder info = new StringBuilder();
        info.append("===SYSTEM ACCESS GRANTED ==\n\n");
        info.append("Welcome to the system, ").append(username).append("!\n\n");
        info.append("--- Details ---\n");
        info.append("• User (whoami) : ").append(username).append("\n");
        info.append("• Hostname      : ").append(hostname).append("\n");
        info.append("• OS Release    : ").append(osVersion).append("\n");
        info.append("• OS Name       : ").append(osName).append("\n");
        info.append("• Architecture  : ").append(osArch).append("\n\n");
        info.append("Have a good session!");

        // Show GUI Popup
        JOptionPane.showMessageDialog(
            null, 
            info.toString(), 
            "System Information", 
            JOptionPane.INFORMATION_MESSAGE
        );
    }
}
