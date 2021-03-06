------------------------------------------------------------------------------
--                             Templates Parser                             --
--                                                                          --
--                     Copyright (C) 2005-2012, AdaCore                     --
--                                                                          --
--  This is free software;  you can redistribute it  and/or modify it       --
--  under terms of the  GNU General Public License as published  by the     --
--  Free Software  Foundation;  either version 3,  or (at your option) any  --
--  later version.  This software is distributed in the hope  that it will  --
--  be useful, but WITHOUT ANY WARRANTY;  without even the implied warranty --
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU     --
--  General Public License for  more details.                               --
--                                                                          --
--  You should have  received  a copy of the GNU General  Public  License   --
--  distributed  with  this  software;   see  file COPYING3.  If not, go    --
--  to http://www.gnu.org/licenses for a complete copy of the license.      --
------------------------------------------------------------------------------

--  Program that tests the <<if ... elsif ... else ... end if>> templates

with Ada.Text_IO; use Ada.Text_IO;

with Templates_Parser; use Templates_Parser;

procedure Test_Templates_If is

   procedure Run is
      Names_To_Display, References_Names, Depths : Vector_Tag;
      Translations : Translate_Table (1 .. 3);
      First_Node   : Natural := 0;
   begin
      Names_To_Display := Names_To_Display & "titi";
      Names_To_Display := Names_To_Display & ".";
      Names_To_Display := Names_To_Display & "tata";
      Names_To_Display := Names_To_Display & "..";
      Names_To_Display := Names_To_Display & "toto";
      Names_To_Display := Names_To_Display & "toutou";

      References_Names := References_Names & "titi";
      References_Names := References_Names & ".";
      References_Names := References_Names & "tata";
      References_Names := References_Names & "..";
      References_Names := References_Names & "toto";
      References_Names := References_Names & "toutou";

      Depths := Depths & "=";
      Depths := Depths & "+1";
      Depths := Depths & "=";
      Depths := Depths & "-1";
      Depths := Depths & "=";
      Depths := Depths & "=";

      Translations :=
        (Assoc ("ITEM", Names_To_Display),
         Assoc ("FILE_NAME", References_Names),
         Assoc ("DEPTH", Depths)
        );

      Put_Line (Parse ("ftp.tmplt", Translations));
   end Run;

begin
   Run;
end Test_Templates_If;
