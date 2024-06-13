Dropped database 'chaperone_development'
Dropped database 'chaperone_test'
Created database 'chaperone_development'
Created database 'chaperone_test'
== 20240603144628 DeviseCreateUsers: migrating ================================
-- create_table(:users)
   -> 0.0042s
-- add_index(:users, :email, {:unique=>true})
   -> 0.0010s
-- add_index(:users, :reset_password_token, {:unique=>true})
   -> 0.0010s
== 20240603144628 DeviseCreateUsers: migrated (0.0064s) =======================

== 20240604111658 CreateSessions: migrating ===================================
-- create_table(:meetings)
   -> 0.0050s
== 20240604111658 CreateSessions: migrated (0.0050s) ==========================

== 20240604112307 AddInformationToUserModel: migrating ========================
-- add_column(:users, :first_name, :string)
   -> 0.0015s
-- add_column(:users, :last_name, :string)
   -> 0.0007s
-- add_column(:users, :date_of_birth, :date)
   -> 0.0006s
-- add_column(:users, :mobile_number, :string)
   -> 0.0003s
-- add_column(:users, :address, :string)
   -> 0.0003s
-- add_column(:users, :gender, :string)
   -> 0.0003s
-- add_column(:users, :sexuality, :string)
   -> 0.0003s
-- add_column(:users, :admin, :boolean)
   -> 0.0003s
== 20240604112307 AddInformationToUserModel: migrated (0.0043s) ===============

== 20240604115503 CreateFriends: migrating ====================================
-- create_table(:friends)
   -> 0.0025s
== 20240604115503 CreateFriends: migrated (0.0025s) ===========================

== 20240604115655 CreateFriendSessions: migrating =============================
-- create_table(:friend_meetings)
   -> 0.0030s
== 20240604115655 CreateFriendSessions: migrated (0.0030s) ====================

== 20240604115954 CreateMessages: migrating ===================================
-- create_table(:messages)
   -> 0.0034s
== 20240604115954 CreateMessages: migrated (0.0034s) ==========================

== 20240606115526 CreateLocations: migrating ==================================
-- create_table(:locations)
   -> 0.0025s
== 20240606115526 CreateLocations: migrated (0.0025s) =========================

== 20240606115624 RemoveCoordinatesFromMeetings: migrating ====================
-- remove_column(:meetings, :latitude, :float)
   -> 0.0012s
-- remove_column(:meetings, :longitude, :float)
   -> 0.0003s
== 20240606115624 RemoveCoordinatesFromMeetings: migrated (0.0015s) ===========

== 20240610091008 AddDurationToMeetings: migrating ============================
-- add_column(:meetings, :duration, :integer)
   -> 0.0008s
== 20240610091008 AddDurationToMeetings: migrated (0.0009s) ===================

== 20240612105735 AddColumnsToFriends: migrating ==============================
-- add_column(:friends, :image_url, :string)
   -> 0.0008s
-- add_column(:friends, :phone, :string)
   -> 0.0003s
== 20240612105735 AddColumnsToFriends: migrated (0.0012s) =====================

== 20240612140053 AddShareCodeToUsers: migrating ==============================
-- add_column(:users, :share_code, :string)
   -> 0.0009s
== 20240612140053 AddShareCodeToUsers: migrated (0.0009s) =====================

== 20240612153126 AddNameToFriends: migrating =================================
-- add_column(:friends, :name, :string)
   -> 0.0008s
== 20240612153126 AddNameToFriends: migrated (0.0008s) ========================

