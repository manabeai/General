use clap::{Parser, Subcommand};

/// A simple calculator
#[derive(Parser)]
#[command(author, version, about, long_about = None)]
struct Cli {
    /// The subcommand to run
    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand, Debug)]
enum Commands {
    /// Add two numbers
    Add {
        /// The first number
        x: i32,
        /// The second number
        y: i32,
    },
    /// Subtract two numbers
    Sub {
        /// The first number
        x: i32,
        /// The second number
        y: i32,
    },
}

fn main() {
    let cli = Cli::parse();

    match cli.command {
        Commands::Add { x, y } => {
            println!("Result: {}", x + y);
        }
        Commands::Sub { x, y } => {
            println!("Result: {}", x - y);
        }
    }
}
