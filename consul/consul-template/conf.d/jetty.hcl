consul {
	address = "127.0.0.1:8500"
}
template {
	source = "./conf.d/config.ctmpl"
	destination = "./conf.d/config.py"
	command = ""
}