import 'package:instagram/core/services/caching.dart';

const String imageUrlOnline =
    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEie_PDCViJm5sThqOyuap4ZPC5FpyImwi_xr8WbK-j1Rf80gK9JdO0Mzjz1v8EDoZYEkzZz8ly5I0p___l9SGZ2lhelmV15hociGHFerG2ICk37_aW7RhH-PMd5Lx-6ScP5yEBvxRsttf566v0Gl_TJDDX5RQ1snn-tOpVuD0jeVr5Ew-zlhRD-XLP0VxJP/w320-h400-rw/%D8%B5%D9%88%D8%B1%D8%A9-%D8%AC%D9%85%D9%8A%D9%84%D8%A9-%D8%AC%D8%AF%D9%8A%D8%AF%D8%A9%20(3).jpg';
CacheHelper cashing = CacheHelper();
String currentUserId = cashing.getData(key: 'token');
