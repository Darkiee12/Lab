import './App.css'
import { BrowserRouter as Router, Routes, Route} from 'react-router-dom';
import Course from './src/pages/Course';
import Home from './src/pages/Home';
function App() {

  return (
    <Router>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/course" element={<Course />} />
        </Routes>
    </Router>
  )
}

export default App
