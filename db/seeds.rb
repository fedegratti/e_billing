Client.create!([{first_name: "Federico", last_name: "Gratti", birthday: "1990-12-13", gender: "M", dni: 34967836, cuit: 20349678368, email: "federicogratti@gmail.com", telephone: 2215463412, skype: "fedeskype"},
                {first_name: "German", last_name: "Gonzales", birthday: "1994-06-12", gender: "M", dni: 24657867, cuit: 20246578679, email: "germangonzales@gmail.com", telephone: 1178646748, skype: "germans"}])

Person.create!([{name: "Person 1", cuit: 30234354679, legal: 1},
                {name: "Person 2", cuit: 24344324568, legal: 0},
                {name: "Person 3", cuit: 20233546748, legal: 0}
])

Bill.create!([{client_id: 1, person_id: 2, description: "Bill description 1", total_amount: 111, issue_date: "2015-12-13"},
              {client_id: 1, person_id: 3, description: "Bill description 2", total_amount: 222, issue_date: "2015-12-13"},
              {client_id: 2, person_id: 1, description: "Bill description 3", total_amount: 333, issue_date: "2014-12-13"}
])