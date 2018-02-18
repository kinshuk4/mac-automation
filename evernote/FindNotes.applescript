-- https://github.com/bkfarnsworth/side_projects/tree/master/AppleScripts
var Evernote = Application('Evernote');

var list = Evernote.findNotes('AUTOMATE EVERNOTE');

list.forEach(function(item){

	var title = item.title();

	console.log(title);

})

Evernote.activate(); 