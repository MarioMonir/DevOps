import { useEffect, useState } from "react";
import reactLogo from "./assets/react.svg";
import "./App.css";

// =========================================================

const useFetch = () => {
  const [state, setState]: any = useState({
    data: [],
    isLoading: false,
    error: null,
  });

  // ~ ~ ~ ~ ~ ~~ ~ ~ ~ ~ ~ ~ ~ ~ ~

  useEffect(() => {
    (async () => {
      try {
        setState({ ...state, isLoading: true });
        let response = await fetch("http://localhost:5000/user");
        console.log({ response });
        let data = await response.json();
        console.log({ data });
        if (data) return setState({ data, error: null, isLoading: false });
      } catch (err: any) {
        console.log({ err: err.message });
        return setState({ data: null, error: err.message, isLoading: false });
      }
      return { ...state, isLoading: false };
    })();
  }, []);

  // ~ ~ ~ ~ ~ ~~ ~ ~ ~ ~ ~ ~ ~ ~ ~

  return { ...state };
};

// =========================================================

function App() {
  const { data: users, isLoading, error }: any = useFetch();

  return (
    <div className="App">
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src="/vite.svg" className="logo" alt="Vite logo" />
        </a>
        <a href="https://reactjs.org" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>{error ? error : !isLoading ? "Users" : "Loading ..."}</h1>
      {users?.map(({ id, name }: any, index: number) => (
        <div key={index} style={{ margin: "10px" }}>
          <button>{`${id} - ${name}`}</button>
        </div>
      ))}
      {/* ------------------------------ */}
    </div>
  );
}

export default App;
