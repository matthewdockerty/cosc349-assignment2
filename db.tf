# Guidance from https://medium.com/@geekrodion/amazon-documentdb-and-aws-lambda-with-terraform-34a5d1061c15

resource "aws_docdb_subnet_group" "db_sg" {
  subnet_ids = "${aws_subnet.public.*.id}"
}

resource "aws_docdb_cluster_instance" "db_ci" {
  count              = 1
  identifier         = "cosc349-docdb-${count.index}"
  cluster_identifier = "${aws_docdb_cluster.db_c.id}"
  instance_class     = "db.r4.large"
}

resource "aws_docdb_cluster" "db_c" {
  skip_final_snapshot     = true
  db_subnet_group_name    = "${aws_docdb_subnet_group.db_sg.name}"
  cluster_identifier      = "cosc349-docdb"
  engine                  = "docdb"
  master_username         = "cosc349"
  master_password         = "${var.db_password}"
  port                    = 27017
  db_cluster_parameter_group_name = "${aws_docdb_cluster_parameter_group.db_pg.name}"
  vpc_security_group_ids = ["${aws_security_group.app_servers.id}"]
}

resource "aws_docdb_cluster_parameter_group" "db_pg" {
  family = "docdb3.6"

  parameter {
    name  = "tls"
    value = "disabled"
  }
}