Cat.create!({
  birth_date: '1991/08/29',
  color: 'black',
  name: 'Rob',
  sex: 'M',
  description: 'Rob goes to app academy in SF'
})

Cat.create!({
  birth_date: '1986/12/01',
  color: 'orange',
  name: 'Dan',
  sex: 'M',
  description: 'Dan is very fluffy'
})

CatRentalRequest.create!({
  cat_id: 1,
  start_date: '2016/01/01',
  end_date:'2016/01/30',
  status: 'APPROVED'
})

CatRentalRequest.create!({
  cat_id: 1,
  start_date: '2016/02/05',
  end_date: '2016/02/10',
  status: 'PENDING'
})

CatRentalRequest.create!({
  cat_id: 2,
  start_date: '2016/03/05',
  end_date: '2016/03/10',
  status: 'PENDING'
})

CatRentalRequest.create!({
  cat_id: 1,
  start_date: '2016/03/05',
  end_date: '2016/03/10',
  status: 'PENDING'
})
