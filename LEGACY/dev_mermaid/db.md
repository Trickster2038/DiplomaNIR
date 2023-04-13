erDiagram
		LevelsBrief ||--o{ SolutionEfforts : is_used_in
		Users ||--o{ SolutionEfforts : makes


		LevelsBrief ||--o{ AdminChangeLog : is_changed_in
		Users ||--o{ AdminChangeLog : makes_changes
		
		Types ||--o{ LevelsBrief : definites_type

		LevelsBrief ||--|| LevelsData : keeps_blob_info


Types {
				int id
				varchar name
}

LevelsBrief {
        int id
				 int level_type
        int seqnum
				 int cost
				 bool is_active
        varchar name
				 varchar brief
    }

LevelsData {
				 int id
				 TEXT wide_description
				 TEXT code
				 TEXT question
				 TEXT answer
}

Users {
				int id
			  varchar nickname
}

SolutionEfforts {
				int id
				int user_id
				int level_id
				bool is_successful
				timestamp time
}

AdminChangeLog
