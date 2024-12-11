use clap::{Parser, ValueEnum};
2
#[derive(Parser)]
#[command(version, about, long_about = None)]
struct Cli {
    #[arg(value_enum)]
    mode: Mode,

    nums: Vec<i32>,
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
            let sum = cli.nums.iter().sum::<i32>();
            println!("Sum: {}", sum);
        }
        Mode::Min => {
            let difference = cli.nums[0] - cli.nums.iter().skip(1).sum::<i32>();
            println!("Difference: {}", difference);
        }
    }
}

#[test]
fn verify_cli() {
    use clap::CommandFactory;
    Cli::command().debug_assert();
}
