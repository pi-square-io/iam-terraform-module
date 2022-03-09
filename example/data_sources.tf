data "template_file" "policy" {
  template = file("./example.json")
vars = {
    bucket_name = "wrdpress-code"
  }
}