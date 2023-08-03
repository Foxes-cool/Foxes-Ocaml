(lang dune 3.9)

(name foxes)

(generate_opam_files true)

(source
 (github Foxes-cool/Foxes-Ocaml))

(authors "Arthur Melton")

(maintainers "Arthur Melton")

(license MIT)

(documentation https://foxes.cool/docs)

(package
 (name foxes)
 (synopsis "An API for all your fox image needs")
 (description "An API for all your fox image needs")
 (depends ocaml dune cohttp-lwt-unix lwt_ssl)
 (tags
  (libarry fox foxes foxes-cool)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
