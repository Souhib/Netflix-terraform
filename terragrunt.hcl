remote_state {
  backend = "s3"
  config = {
    bucket                   = "netflix-terraform-state"
    key                      = "netflix.tfstate"
    region                   = "eu-west-1"
    encrypt                  = true
  }
}