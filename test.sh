#!/bin/bash
#Copyright (c) 2024-2025 Divested Computing Group
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU Affero General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU Affero General Public License for more details.
#
#You should have received a copy of the GNU Affero General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

while read line; do
	if [ -f "0ABORT0" ]; then break; fi;
	if /usr/bin/dig @1.0.0.1 +timeout=1 +short HTTPS "$line" | grep -q "ech="; then
		if /usr/bin/dig @1.0.0.1 +timeout=1 ns "$line" | grep -q -e "ns\.cloudflare\.com" -e "\.foundationdns\."; then
			echo "YES & CF: $line";
		else
			echo "YES & !CF: $line";
		fi;
	else
		echo "NO: $line";
	fi;
done < domains.txt;
