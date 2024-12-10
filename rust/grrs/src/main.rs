use clap::Parser;

/// Search for a pattern in a file and display the lines that contain it.
#[derive(Parser)]
#[command(version, about)]
struct Cli {
    /// The pattern to look for
    pattern: String,
    /// The path to the file to read
    path: std::path::PathBuf,
    #[arg]

    quote: String,

}

fn main() {
    let args = Cli::parse();

    println!("pattern: {:?}, path: {:?}, qupte; {:?}", args.pattern, args.path, args.quote);
}