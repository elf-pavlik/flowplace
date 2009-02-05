
EmailAddressRegEx = %r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i

CountryOptions= [	[ "-" , nil ],
									[ "US" , "US" ], 
									[ "Canada" , "CAN" ], 
									[ "Guatemala" , "GUA" ],
									[ "Mexico" , "MEX" ], 
									[ "Trinidad and Tobago" , "TRINTOB" ]]

StateNameOptions= [	[ "-" , nil ],
									[ "AL" , "AL" ], 
									[ "AK" , "AK" ], 
									[ "AR" , "AR" ], 
									[ "AZ" , "AZ" ], 
									[ "CA" , "CA" ], 
									[ "CO" , "CO" ], 
									[ "CT" , "CT" ], 
									[ "DC" , "DC" ], 
									[ "DE" , "DE" ], 
									[ "FL" , "FL" ], 
									[ "GA" , "GA" ], 
									[ "HI" , "HI" ], 
									[ "IA" , "IA" ], 
									[ "ID" , "ID" ], 
									[ "IL" , "IL" ], 
									[ "IN" , "IN" ], 
									[ "KS" , "KS" ], 
									[ "KY" , "KY" ], 
									[ "LA" , "LA" ], 
									[ "MA" , "MA" ], 
									[ "MD" , "MD" ], 
									[ "ME" , "ME" ], 
									[ "MI" , "MI" ], 
									[ "MN" , "MN" ], 
									[ "MO" , "MO" ], 
									[ "MS" , "MS" ], 
									[ "MT" , "MT" ], 
									[ "NC" , "NC" ], 
									[ "ND" , "ND" ], 
									[ "NE" , "NE" ], 
									[ "NH" , "NH" ], 
									[ "NJ" , "NJ" ], 
									[ "NM" , "NM" ], 
									[ "NV" , "NV" ], 
									[ "NY" , "NY" ], 
									[ "OH" , "OH" ], 
									[ "OK" , "OK" ], 
									[ "OR" , "OR" ], 
									[ "PA" , "PA" ], 
									[ "RI" , "RI" ], 
									[ "SC" , "SC" ], 
									[ "SD" , "SD" ], 
									[ "TN" , "TN" ], 
									[ "TX" , "TX" ], 
									[ "UT" , "UT" ], 
									[ "VA" , "VA" ], 
									[ "VT" , "VT" ], 
									[ "WA" , "WA" ], 
									[ "WI" , "WI" ], 
									[ "WV" , "WV" ], 
									[ "WY" , "WY" ],
									[ "Alberta" , "AB" ],
									[ "British Columbia" , "BC" ],
									[ "Manitoba" , "MB" ],
									[ "New Brunswick" , "NB" ],
									[ "Newfoundland and Labrador" , "NandL" ],
									[ "Nova Scotia" , "NS" ],
									[ "Ontario" , "ON" ],
									[ "Prince Edward Island" , "PE" ],
									[ "Quebec" , "QC" ],
									[ "Saskatchewan" , "SK" ],
									["Aguascalientes" , "AGS"],
                  ["Baja California Norte" , "BCN"],
                  ["Baja California Sur" , "BCS"],
                  ["Campeche" , "CAM"],
                  ["Chiapas" , "CHIS"],
                  ["Chihuahua" , "CHIH"],
                  ["Coahuila" , "COAH"],
                  ["Colima" , "COL"],
                  ["Distrito Federal" , "DF"],
                  ["Durango" , "DGO"],
                  ["Guanajuato" , "GTO"],
                  ["Guerrero" , "GRO"],
                  ["Hidalgo" , "HGO"],
                  ["Jalisco" , "JAL"],
                  ["México--Estado de" , "EDM"],
                  ["Michoacán" , "MICH"],
                  ["Morelos" , "MOR"],
                  ["Nayarit" , "NAY"],
                  ["Nuevo León" , "NL"],
                  ["Oaxaca" , "OAX"],
                  ["Puebla" , "PUE"],
                  ["Querétaro" , "QRO"],
                  ["Quintana Roo" , "QROO"],
                  ["San Luis Potosí" , "SLP"],
                  ["Sinaloa" , "SIN"],
                  ["Sonora" , "SON"],
                  ["Tabasco" , "TAB"],
                  ["Tamaulipas" , "TAMPS"],
                  ["Tlaxcala" , "TLAX"],
                  ["Veracruz" , "VER"],
                  ["Yucatán" , "YUC"],
                  ["Zacatecas" , "ZAC"]
									]

 StateNameHash = {
                  "AL" => "AL", 
                  "AK" => "AK", 
                  "AZ" => "AZ", 
                  "AR" => "AR", 
                  "CA" => "CA", 
                  "CO" => "CO", 
                  "CT" => "CT", 
                  "DE" => "DE", 
                  "DC" => "DC", 
                  "FL" => "FL", 
                  "GA" => "GA", 
                  "HI" => "HI", 
                  "IO" => "ID", 
                  "IL" => "IL", 
                  "IN" => "IN", 
                  "IA" => "IA", 
                  "KS" => "KS", 
                  "KY" => "KY", 
                  "LA" => "LA", 
                  "ME" => "ME", 
                  "MD" => "MD", 
                  "MA" => "MA", 
                  "MI" => "MI", 
                  "MN" => "MN", 
                  "MS" => "MS", 
                  "MO" => "MO", 
                  "MT" => "MT", 
                  "NE" => "NE", 
                  "NV" => "NV", 
                  "NH" => "NH", 
                  "NJ" => "NJ", 
                  "NM" => "NM", 
                  "NY" => "NY", 
                  "NC" => "NC", 
                  "ND" => "ND", 
                  "OH" => "OH", 
                  "OK" => "OK", 
                  "OR" => "OR", 
                  "PA" => "PA", 
                  "RI" => "RI", 
                  "SC" => "SC", 
                  "SD" => "SD", 
                  "TN" => "TN", 
                  "TX" => "TX", 
                  "UT" => "UT", 
                  "VT" => "VT", 
                  "VA" => "VA", 
                  "WA" => "WA", 
                  "WV" => "WV", 
                  "WI" => "WI", 
                  "WY" => "WY",
                  "Alberta" => "AB",
                  "British Columbia" => "BC",
                  "Manitoba" => "MB",
                  "New Brunswick" => "NB",
                  "Newfoundland and Labrador" => "NandL",
                  "Nova Scotia" => "NS",
                  "Ontario" => "ON",
                  "Prince Edward Island" => "PE",
                  "Quebec" => "QC",
                  "Saskatchewan" => "SK",
                  "Aguascalientes" => "AGS",
                  "Baja California Norte" => "BCN",
                  "Baja California Sur" => "BCS",
                  "Campeche" => "CAM",
                  "Chiapas" => "CHIS",
                  "Chihuahua" => "CHIH",
                  "Coahuila" => "COAH",
                  "Colima" => "COL",
                  "Distrito Federal" => "DF",
                  "Durango" => "DGO",
                  "Guanajuato" => "GTO",
                  "Guerrero" => "GRO",
                  "Hidalgo" => "HGO",
                  "Jalisco" => "JAL",
                  "México - Estado de" => "EDM",
                  "Michoacán" => "MICH",
                  "Morelos" => "MOR",
                  "Nayarit" => "NAY",
                  "Nuevo León" => "NL",
                  "Oaxaca" => "OAX",
                  "Puebla" => "PUE",
                  "Querétaro" => "QRO",
                  "Quintana Roo" => "QROO",
                  "San Luis Potosí" => "SLP",
                  "Sinaloa" => "SIN",
                  "Sonora" => "SON",
                  "Tabasco" => "TAB",
                  "Tamaulipas" => "TAMPS",
                  "Tlaxcala" => "TLAX",
                  "Veracruz" => "VER",
                  "Yucatán" => "YUC",
                  "Zacatecas" => "ZAC"}
                  									
  								