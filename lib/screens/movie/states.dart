abstract class MovieStates {}

class MovieInitialState extends MovieStates {}
class GetMoviesSuccessState extends MovieStates {}
class GetMoviesLoadingState extends MovieStates {}
class GetMoviesRefreshState extends MovieStates {}