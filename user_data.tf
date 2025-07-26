resource "aws_instance" "java_app" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t3.micro"

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras enable java-openjdk11
    yum install -y java-11-openjdk

    mkdir -p /opt/java-app
    cd /opt/java-app

    # Here you’d use S3, Git, or build artifact pipeline to fetch the jar
    wget https://my-bucket.s3.amazonaws.com/metadata-app.jar -O app.jar

    cat <<SCRIPT > start.sh
    #!/bin/bash
    exec java -jar /opt/java-app/app.jar --server.port=8080
    SCRIPT

    chmod +x start.sh
    nohup bash start.sh &

    echo "Metadata API launched"
  EOF

  tags = {
    Name = "Java REST Metadata Server"
  }
}

