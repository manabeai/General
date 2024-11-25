import { render, screen, fireEvent } from '@testing-library/react';
import { Square } from '../App'; 
import App from '../App';
import react from 'react';

test('renders a board element with data-testid=board', () => {
  render(<App />);

  const boardElement = screen.getByTestId('board');

  expect(boardElement).toBeInTheDocument();
});

describe('Square component', () => {
  test('renders the Square with the correct value', () => {
    const mockOnClick = jest.fn();  // モック関数を作成
    render(<Square value="X" onSquareClick={mockOnClick} />);  // Squareコンポーネントをレンダリング

    // Squareボタンが正しい値('X')を表示しているか確認
    expect(screen.getByText('X')).toBeInTheDocument();
  });

  test('calls onSquareClick when clicked', () => {
    const mockOnClick = jest.fn();  // モック関数を作成
    render(<Square value={null} onSquareClick={mockOnClick} />);  // Squareコンポーネントをレンダリング

    const button = screen.getByRole('button');  // ボタン要素を取得
    fireEvent.click(button);  // ボタンをクリック

    // onSquareClickが1回呼ばれたことを確認
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });
});
