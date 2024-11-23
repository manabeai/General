import React from 'react';
import "./styles.css";

interface SquareProps {
  value: string;
}

// Squareコンポーネント
const Square: React.FC<SquareProps> = ({ value }) => {
  return (
    <button className="square">
      {value}
    </button>
  );
};

// Boardコンポーネント
const Board = () => {
  return (
    <>
      <Square value="1" />
    </>
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
