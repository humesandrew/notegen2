const req = require("express/lib/request");
const fs = require("fs");
const util = require("util");
const uuid = require("uuid");

const readFileSync = util.promisify(fs.readFile);
const writeFileSync = util.promisify(fs.writeFile);

class Store {
  read() {
    return readFileSync("db/db.json", "utf8");
  }
  write(note) {
    return writeFileSync("db/db.json", JSON.stringify(note));
  }

  getNotes() {
    return this.read().then((notes) => {
      let parsedNotes;
      try {
        parsedNotes = [].concat(JSON.parse(notes));
      } catch (err) {
        parsedNotes = [];
      }
      return parsedNotes;
    });
  }
  addNote(note) {
      const { title, text } = note;
      if (!title || !text) {
          throw new Error("You need a note title and body text.");
      }
      const newNote = { title, text, id: uuid()};
      return this.getNotes().then((notes) => [...notes, newNote])
      .then((updatedNotes) => this.write(updatedNotes))
      .then(() => newNote);
  }
  removeNote(id) {}
}
