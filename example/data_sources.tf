data "template_file" "policy" {
  template = file("./example.json")
vars = {
    bucket_name = "wrdpress-code"
  }
}


#template file and rendiring should be done in the module
# Users only need to specify the path of the file
# Same goes for as assume_role_policy