client1 = Client.create!({first_name: "Federico", last_name: "Gratti", birthday: "1990-12-13", gender: "M", dni: 34967836, cuit: 20349678368})
client2 = Client.create!({first_name: "German", last_name: "Gonzales", birthday: "1994-06-12", gender: "M", dni: 24657867, cuit: 20246578679})

person1 = Person.create!({name: "Person 1", cuit: 30234354679, legal: 1})
person2 = Person.create!({name: "Person 2", cuit: 24344324568, legal: 0})
person3 = Person.create!({name: "Person 3", cuit: 20233546748, legal: 0})
puts client1.id
Bill.create!([{client_id:client1.id, person_id: person2.id, description: "Bill description 1", total_amount: 111, issue_date: "2015-12-13"},
              {client_id: client1.id, person_id: person3.id, description: "Bill description 2", total_amount: 222, issue_date: "2015-12-13"},
              {client_id: client2.id, person_id: person1.id, description: "Bill description 3", total_amount: 333, issue_date: "2014-12-13"}
])

ContactInfo.create!([{client_id: client1.id, name: "email", value: "federicogratti@gmail.com"},
                     {client_id: client1.id, name: "email", value: "federicogratti@live.com.ar"},
                     {client_id: client1.id, name: "address", value: "13 n 1139"},
                     {client_id: client1.id, name: "phone_number", value: 2214634122},
                     {client_id: client1.id, name: "cell_number", value: 2215478554},
                     {client_id: client1.id, name: "facebook", value: "fede.gratti"},
                     {client_id: client2.id, name: "email", value: "germangonzales@gmail.com"},
                     {client_id: client2.id, name: "address", value: "3 y 65"},
                     {client_id: client2.id, name: "phone_number", value: 1178646748},
                     {client_id: client2.id, name: "facebook", value: "german.gonzales"},
                     {client_id: client2.id, name: "skype", value: "german.gonzales"},
])
