terraform {
  required_version = "= 1.10.4"
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "dotlife-terra"

  assume_role {
    role_arn     = "arn:aws:iam::637423323564:role/terraform-kai-assumerole"
    session_name = "terraform-session"
  }
}
