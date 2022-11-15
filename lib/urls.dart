Uri retriveURL = Uri(
  //http://notestestapplication.herokuapp.com/notes/s
  scheme: 'https',
  host: 'notestestapplication.herokuapp.com',
  path: '/notes/',
);

Uri createURL = Uri(
  scheme: 'https',
  host: 'notestestapplication.herokuapp.com',
  path: '/notes/create/',
);

Uri deleteURL(int id) {
  return Uri(
    scheme: 'https',
    host: 'notestestapplication.herokuapp.com',
    path: '/notes/' + id.toString() + '/delete/',
  );
}

Uri updateURL(int id) {
  return Uri(
    scheme: 'https',
    host: 'notestestapplication.herokuapp.com',
    path: '/notes/' + id.toString() + '/update/',
  );
}
