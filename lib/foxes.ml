open Cohttp_lwt_unix

type tags = {
    time: int;
    count: int;
};;

Random.self_init ();;

let totals = Hashtbl.create 5;;

let internal name options =
    let time = int_of_float (Unix.time ())/86400 in
    if not (Hashtbl.mem totals name) || (Hashtbl.find totals name).time != time
    then begin
        let (_, body) = Lwt_main.run (Client.get (Uri.of_string ("https://foxes.cool/counts/" ^ name))) in
        let count = int_of_string (Lwt_main.run @@ Cohttp_lwt.Body.to_string @@ body) in
        Hashtbl.replace totals name {
            time = time;
            count = count;
        };
    end;
    let id = string_of_int @@ Random.int @@ (Hashtbl.find totals name).count in
    let params = if List.length options > 0 then
        ("?" ^ (String.concat "&" options))
    else "" in
    ("https://img.foxes.cool/" ^ name ^ "/" ^ id ^ ".jpg" ^ params)
;;

(* Tag functions *)

let fox options =
    internal "fox" options;;

let curious options =
    internal "curious" options;;

let happy options =
    internal "happy" options;;

let scary options =
    internal "scary" options;;

let sleeping options =
    internal "sleeping" options;;

(* Params *)

let width x =
    ("width=" ^ string_of_int x);;

let height y =
    ("height=" ^ string_of_int y);;

let aspect_ratio ar =
    ("aspect_ratio=" ^ ar);;
