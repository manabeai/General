import React, { useState } from 'react';
import "./styles.css";
type SquareProps = {
  value: string | null;
  onSquareClick: () => void;
};

type Squares = Array<string | null>;

export const Square: React.FC<SquareProps> = ({ value, onSquareClick }) => {
  return <button className="square" onClick={onSquareClick}>{value}</button>;
};

const Board = () => {
  const [squares, setSquares] = useState<Squares>(Array(9).fill(null));

  const handleClick = (i: number) => {
    const nextSquares: Squares = squares.slice();
    nextSquares[i] = "X";
    setSquares(nextSquares);
  }

  return (
    <div className="board" data-testid="board">
      <div className="board-row">
        <Square value={squares[0]} onSquareClick={() => handleClick(0)} />
        <Square value={squares[1]} onSquareClick={() => handleClick(1)} />
        <Square value={squares[2]} onSquareClick={() => handleClick(2)} />
      </div>
      <div className="board-row">
        <Square value={squares[3]} onSquareClick={() => handleClick(3)} />
        <Square value={squares[4]} onSquareClick={() => handleClick(4)} />
        <Square value={squares[5]} onSquareClick={() => handleClick(5)} />
      </div>
      <div className="board-row">
        <Square value={squares[6]} onSquareClick={() => handleClick(6)} />
        <Square value={squares[7]} onSquareClick={() => handleClick(7)} />
        <Square value={squares[8]} onSquareClick={() => handleClick(8)} />
      </div>
    </div>
  );
}


function App() {
  return (
    <div className="App">
      <Board />
    </div>
  );
}

export default App;
