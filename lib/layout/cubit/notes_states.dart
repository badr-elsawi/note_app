abstract class NotesStates {}
class NotesInitialState extends NotesStates {}
//*****************************************************************
class NotesGetDataLoadingState extends NotesStates {}
class NotesGetDataSuccessState extends NotesStates {}
class NotesGetDataErrorState extends NotesStates {}
//*****************************************************************
class SelectCategoryState extends NotesStates {}
//*****************************************************************
class SelectColorState extends NotesStates {}
//*****************************************************************
class AddNoteSuccessState extends NotesStates {}
//*****************************************************************
class UpdateNoteSuccessState extends NotesStates {}
