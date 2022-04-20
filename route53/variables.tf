variable "records_name" {
  type    = list(string)
  default = ["souhib-trabelsi.ddns.net"] # put your record(s)
}

variable "services_name" {
  type    = list(string)
  default = ["jellyfin1", "radarr1", "sonarr1", "jackett1", "portainer1", "traefik1", "qbittorent"] # put your record(s)
}