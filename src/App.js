import React, { Component } from 'react';
import { CardList } from './components/card-list/card-list';
import { SearchBox } from './components/search-box/search-box';
import './App.css';

// Using a class component, we get access to State

class App extends Component {
  constructor() {
    super();

    this.state = {
      monsters: [
        {
          name: "Leanne Graham",
          id: "1",
          email: "leanne.graham@mail.com"
        },
        {
          name: "Ervin Howell",
          id: "2",
          email: "ervin.howell@mail.com"
        },
        {
          name: "Clementine Bauch",
          id: "3",
          email: "clementine.bauch@mail.com"
        },
        {
          name: "Patricia Lebsack",
          id: "4",
          email: "patricia.lebsack@mail.com"
        },
        {
          name: "Chelsey Dietrich",
          id: "5",
          email: "chelsey.dietrich@mail.com"
        },
        {
          name: "Mrs. Dennis Schulist",
          id: "6",
          email: "dennis.schulist.mail.com"
        },
        {
          name: "Kurtis Weissnat",
          id: "7",
          email: "kurtis.weissnat@mail.com"
        },
        {
          name: "Nicholas Runolfsdottir V",
          id: "8",
          email: "nicholas.runolfsddottir@mail.com"
        },
        {
          name: "Glenna Reichert",
          id: "9",
          email: "glenna.reichert@mail.com"
        },
        {
          name: "Clementina DuBuque",
          id: "10",
          email: "clementina.dubuque@mail.com"
        }
      ],
      searchField: ''
    };
  }

  handleChange = (e) => {
    this.setState({ searchField: e.target.value })
  };

  render() {
    // Destructuring
    const { monsters, searchField } = this.state;
    // Line 70 is equivalent to the below
    // const monsters = this.state.monsters;
    // const searchField = this.state.searchField;
    const filteredMonsters = monsters.filter(
      monster => monster.name.toLowerCase().includes(searchField.toLowerCase())
    )
    return (
      <div className="App">
        <h1>Monsters Rolodex</h1>
        <SearchBox
          placeholder='Search Monsters'
          handleChange={this.handleChange}
        />
        <CardList monsters={filteredMonsters} />
      </div>
    )
  }
}

export default App;
