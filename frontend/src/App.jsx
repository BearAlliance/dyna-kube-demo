import './App.css';
import { Title } from './title';
import { Demos } from './demos';

function App() {
  return (
    <div>
      <Title />
      <div className="container">
        <Demos />
      </div>
    </div>
  );
}

export default App;
