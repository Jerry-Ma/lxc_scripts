hostname := `hostname`
srcdir := join(justfile_directory(), "src")
lxcbin := `command -v lxc`


default: system_info
  @just --list

system_info:
  @echo "arch: {{arch()}}"
  @echo "os: {{os()}}"
  @echo "hostname: {{hostname}}"
  @echo "srcdir: {{srcdir}}"


ensure_lxc:
  @if ! test -x {{lxcbin}} ; then echo "no lxc found, abort" && exit 1; fi


lxc_list: ensure_lxc
  @{{lxcbin}} list
