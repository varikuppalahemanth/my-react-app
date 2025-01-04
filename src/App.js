import React, { useState } from 'react';
import './App.css';

function App() {
  const [count, setCount] = useState(0);

  const incrementCount = () => {
    setCount(count + 1);
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>Welcome to My React App!</h1>
        <p>
          This is a simple React app. Current count is: <strong>{count}</strong>
        </p>
        <button onClick={incrementCount}>Increment Count</button>
      </header>
    </div>
  );
}

export default App;

