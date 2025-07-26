@RestController
public class MetadataController {
    @GetMapping("/metadata")
    public String getMetadata() throws IOException {
        URL url = new URL("http://169.254.169.254/latest/meta-data/public-ipv4");
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()))) {
            return "EC2 Public IP: " + reader.readLine();
        }
    }
}

