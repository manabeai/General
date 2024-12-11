use clap::{Arg, Command};

fn main() {
    // コマンドライン引数のパース
    let matches = Command::new("calc")
        .version("1.0")
        .author("Your Name <your.email@example.com>")
        .about("A simple calculator")
        .subcommand_required(true) // 必須にする
        .arg_required_else_help(true) // サブコマンドがない場合ヘルプを表示
        .subcommand(
            Command::new("add")
                .about("Add two numbers")
                .arg(
                    Arg::new("x")
                        .help("The first number")
                        .required(true)
                        .value_parser(clap::value_parser!(i32)),
                )
                .arg(
                    Arg::new("y")
                        .help("The second number")
                        .required(true)
                        .value_parser(clap::value_parser!(i32)),
                ),
        )
        .subcommand(
            Command::new("sub")
                .about("Subtract two numbers")
                .arg(
                    Arg::new("x")
                        .help("The first number")
                        .required(true)
                        .value_parser(clap::value_parser!(i32)),
                )
                .arg(
                    Arg::new("y")
                        .help("The second number")
                        .required(true)
                        .value_parser(clap::value_parser!(i32)),
                ),
        )
        .get_matches();

    // サブコマンドに応じた処理
    match matches.subcommand() {
        Some(("add", sub_matches)) => {
            let x: i32 = *sub_matches.get_one("x").unwrap();
            let y: i32 = *sub_matches.get_one("y").unwrap();
            println!("Result: {}", x + y);
        }
        Some(("sub", sub_matches)) => {
            let x: i32 = *sub_matches.get_one("x").unwrap();
            let y: i32 = *sub_matches.get_one("y").unwrap();
            println!("Result: {}", x - y);
        }
        _ => unreachable!(), // 他のサブコマンドは存在しないので到達しない
    }
}
