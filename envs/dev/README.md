🔄 Conceptual Sequence

    Local backend first: bootstrap/main.tf uses local state by default.

    Deploy remote backend: Provision the S3 bucket + DynamoDB.

    Activate remote backend: Update backend.tf with the bucket/table names.

    Re-init: Terraform now reconfigures to use the remote backend.
