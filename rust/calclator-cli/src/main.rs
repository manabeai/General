use clap::{Parser, ValueEnum};

#[derive(Parser)]
#[command(version, about, long_about = None)]
struct Cli {

    #[arg(value_enum)]
    mode: Mode,

    num1: u64,
    num2: u64,
}

#[derive(Copy, Clone, PartialEq, Eq, PartialOrd, Ord, ValueEnum)]
enum Mode {
    Add,
    Min,
}

fn main() {
    let cli = Cli::parse();

    match cli.mode {
        Mode::Add => {
            let sum = cli.num1 + cli.num2;
            println!("Sum: {}", sum);
        }
        Mode::Min => {
            let difference = cli.num1.saturating_sub(cli.num2);
            println!("Difference: {}", difference);
        }
    }
}
