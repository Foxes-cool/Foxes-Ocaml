let () =
    print_endline @@ Foxes.fox [];
    print_endline @@ Foxes.fox [Foxes.width 150];
    print_endline @@ Foxes.fox [Foxes.width 150; Foxes.height 150];
    print_endline @@ Foxes.fox [Foxes.width 150; Foxes.height 150; Foxes.aspect_ratio "1:2"];
