input = {
    status: 200,
    meta: {
      size: 1000,
      hight: 12,
      type: 'persons'
    },
    persons: [
      {
        name: 'John',
        age: 40,
        job: {
          type: 'programmer',
          salary: 2500
        }
      },
      {
        name: 'Mary',
        age: 38,
        job: {
          type: 'music',
          salary: 1500
        }
      }
    ]
  }
  
  job_type_programmer = 'programmer'
  job_type_music = 'music'
  
  case input 
    in persons: [*, {name: name, job: { type: ^job_type_music => type}}, *]
    puts "#{name} => #{type}"
  end