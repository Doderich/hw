Uri retriveURL = Uri(
  //http://notestestapplication.herokuapp.com/notes/s
  scheme: 'https',
  host: 'hwbackendapi.herokuapp.com',
  path: '/students/',
);

Uri createURL = Uri(
  scheme: 'https',
  host: 'hwbackendapi.herokuapp.com',
  path: '/students/create/',
);

Uri deleteURL(int id) {
  return Uri(
    scheme: 'https',
    host: 'hwbackendapi.herokuapp.com',
    path: '/students/' + id.toString() + '/delete/',
  );
}

Uri updateURL(int id) {
  return Uri(
    scheme: 'https',
    host: 'hwbackendapi.herokuapp.com',
    path: '/students/' + id.toString() + '/update/',
  );
}
