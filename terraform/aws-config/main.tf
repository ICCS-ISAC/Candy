data "local_file" "guard_rails" {
  filename = "./GuardRails.yaml"
}

# -----------------------------------------------------------
# Set up the Conformance Pack accross the whole Org
# -----------------------------------------------------------
resource "aws_config_organization_conformance_pack" "cloud_security_guardrails_conformance_pack" {
  name = "cloud-security-guardrails-conformance-pack"

  template_body = data.local_file.guard_rails.content
}
