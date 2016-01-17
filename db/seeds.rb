Client.create!([{first_name: "Federico", last_name: "Gratti", birthday: "1990-12-13", gender: "M", dni: 34967836, cuit: 20349678368},
                {first_name: "German", last_name: "Gonzales", birthday: "1994-06-12", gender: "M", dni: 24657867, cuit: 20246578679}])

Person.create!([{name: "Person 1", cuit: 30234354679, legal: 1},
                {name: "Person 2", cuit: 24344324568, legal: 0},
                {name: "Person 3", cuit: 20233546748, legal: 0}
])

Bill.create!([{client_id: 1, person_id: 2, description: "Bill description 1", total_amount: 111, issue_date: "2015-12-13"},
              {client_id: 1, person_id: 3, description: "Bill description 2", total_amount: 222, issue_date: "2015-12-13"},
              {client_id: 2, person_id: 1, description: "Bill description 3", total_amount: 333, issue_date: "2014-12-13"}
])

ContactInfo.create!([{client_id: 1, name: "email", value: "federicogratti@gmail.com"},
                     {client_id: 1, name: "email", value: "federicogratti@live.com.ar"},
                     {client_id: 1, name: "address", value: "13 n 1139"},
                     {client_id: 1, name: "phone_number", value: 2214634122},
                     {client_id: 1, name: "cell_number", value: 2215478554},
                     {client_id: 1, name: "facebook", value: "fede.gratti"},
                     {client_id: 2, name: "email", value: "germangonzales@gmail.com"},
                     {client_id: 2, name: "address", value: "3 y 65"},
                     {client_id: 2, name: "phone_number", value: 1178646748},
                     {client_id: 2, name: "facebook", value: "german.gonzales"},
                     {client_id: 2, name: "skype", value: "german.gonzales"},
])
