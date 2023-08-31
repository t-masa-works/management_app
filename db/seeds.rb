User.create(name: "hogehoge", email: "hoge@example.com", password: 'hogehoge', password_confirmation: 'hogehoge' )
User.create(name: "ageage", email: "age@example.com", password: 'ageage', password_confirmation: 'ageage' )

User.create(name: "tobe", email: "tobe@gmail.com", password: 'masanori', password_confirmation: 'masanori', admin: true )

Tag.create!(tag_name: "提出物")
Tag.create!(tag_name: "行事")
Tag.create!(tag_name: "会議")