classDiagram

%% === Interfaces ===

class ICreatable{
    +Create()
}
ICreatable --|> Interface

class IReadable{
    +Read() interface
}
IReadable --|> Interface

class IReadableAll{
    +ReadAll() interface
}
IReadableAll --|> Interface

class IUpdatable{
    +Update()
}
IUpdatable --|> Interface

class IDeletable{
    +Delete()
}
IDeletable --|> Interface

class ICheckableSuccessful{
    +CheckSuccessful() interface
}
ICheckableSuccessful --|> Interface

%% === Utilities ===

class Interface{
	
}
class MetaInfo{
			+Obj_type : string
			+Action : string		 
}
class EncapsulatedMetaInfo{
			+MetaInfo : MetaInfo	
}
EncapsulatedMetaInfo --> MetaInfo

%% class EncapsulatedSuccessful{
%%			+Successful : Bool	
%% }

class LevelsList{
			+Levels: []LevelsBrief
}
LevelsList *-- LevelsBrief

%% === Request Frames ===

class RfLevelsBrief {
			+MetaInfo : MetaInfo
			+Data : LevelsBrief
     +Create()
     +Read() interface
     +ReadAll() interface
     +Update()
     +Delete()
}
MetaInfo --> RfLevelsBrief
LevelsBrief --> RfLevelsBrief
RfLevelsBrief ..|> ICreatable
RfLevelsBrief ..|> IReadable
RfLevelsBrief ..|> IReadableAll
RfLevelsBrief ..|> IUpdatable
RfLevelsBrief ..|> IDeletable

class RfLevelsData {
			+MetaInfo : MetaInfo
			+Data : LevelsData
     +Create()
     +Read() interface
     +Update()
     +Delete()
}
MetaInfo --> RfLevelsData
LevelsData --> RfLevelsData
RfLevelsData ..|> ICreatable
RfLevelsData ..|> IReadable
RfLevelsData ..|> IUpdatable
RfLevelsData ..|> IDeletable

class RfSolutionEffort {
			+MetaInfo : MetaInfo
			+Data : SolutionEffort
     +Create()
     +CheckSuccessful() interface
}
MetaInfo --> RfSolutionEffort
SolutionEffort --> RfSolutionEffort
RfSolutionEffort ..|> ICreatable
RfSolutionEffort ..|> ICheckableSuccessful

class RfTypeRecord {
			+MetaInfo : MetaInfo
			+Data : TypeRecord
     +Read() interface
}
MetaInfo --> RfTypeRecord
TypeRecord --> RfTypeRecord
RfTypeRecord ..|> IReadable

class RfUser {
			+MetaInfo : MetaInfo
			+Data : User
     +Read() interface
}
MetaInfo --> RfUser
User --> RfUser
RfUser ..|> IReadable

%% === ORM classes ===

class LevelsBrief {
			+ID : int
			+Level_type : int
			+Seqnum : int
			+Cost : int
			+Is_active : bool
			+Name : string
			+Brief : string
     +Create()
     +Read() 
     +ReadAll() []LevelsBrief
     +Update()
     +Delete()
}

class LevelsData {
			+ID : int
			+WideDescription : string
			+Code : string
			+Question : string
			+Answer : string
     +Create()
     +Read() 
     +Update()
     +Delete()
}

class SolutionEffort {
			+ID : int
			+UserID : int
			+LevelID : int
			+IsSuccessful : bool
			+Time : timestamp
     +Create()
     +CheckSuccessful() bool
}

class TypeRecord {
			+ID : int
			+Name : string
     +Read() 
}

class User {
			+ID : int
			+Nickname : string
     +Read() 
}



