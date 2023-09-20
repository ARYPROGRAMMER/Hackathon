
# Self Review is an extension that utilizes the power of AI to make flashcards from documents.

## THINGS 

- Create, edit, and combine collections (deck).
- Create cards manually or by uploading pdf files/pasting materials.
- Review cards based on SM-2 algorithm 
- Practice reviewed cards using multiple choice or by writing them manually.
- Light and dark themes.


## FLOW  

...
lib
|
|_ 📁src
	|
	|__ 📁core
	|	|__ 📁errors <- define errors and exceptions
	|	|__ 📁router <- generated router & route names
	|	|__ 📁services <- dependency injection & internet connection
	|	|__ 📁theme <- define themes & dynamic theming
	|	|__ 📁utils <- constants (enums, strings, etc..)
	|	|__ 📁widgets <- widgets that are used in multiple screens
	|
	|__ 📁features
		|
		|__ 📁cards
			|__ 📁controller <- Bloc
			|__ 📁data <- data retrieval and caching
			|	|__ 📁models <- business logic
			|	|__ 📁data_source <- works with db and api
			|	|__ 📁repository <- combine and map data
			|__ 📁presentation <- screens and widgets
...


## Limitation
Due to the limitations of chatgpt 3.5 turbo, the API is only able to summarize ~3 pages at a time.
