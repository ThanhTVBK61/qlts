import 'package:flutter_screenutil/flutter_screenutil.dart';

const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';

const SUCCESS = '200';
const TIME_OUT = '498.2';
const ERROR_INPUT = '408.2';

const CONFIG_BASE_URL = 'https://qlts.vnerp.vn/api/v1';
const CONFIG_BASE_URL1 = 'http://10.1.123.7:8088/api/v1';

const HEIGHT_INVENTORY_QRCODE_NO_DATA = 660.0;
const HEIGHT_INVENTORY_QRCODE_DATA = 1010.0;

double ws = ScreenUtil().setWidth(3.5);
double hs = ScreenUtil().setHeight(1.75);
double fs = ScreenUtil().setSp(4);

///
/// ----------------Url webview-------------
///
const URL ='https://id.vnpt.com.vn/cas/login?service=https://qlts.vnerp.vn/web/loginapp?response_type=token&client_id=False&redirect_uri=http%3A%2F%2Fqlts.vnerp.vn%2Fauth_oauth%2Fsignin&scope=False&state=%7B%22d%22%3A+%22vnpt_qlts%22%2C+%22p%22%3A+4%2C+%22r%22%3A+%22http%253A%252F%252Fqlts.vnerp.vn%252Fweb%22%7D';
const URL_LOGOUT = 'https://id.vnpt.com.vn/cas/logout?service=https://id.vnpt.com.vn/cas/login?service=https://qlts.vnerp.vn/web/loginapp?response_type=token&client_id=False&redirect_uri=http%3A%2F%2Fqlts.vnerp.vn%2Fauth_oauth%2Fsignin&scope=False&state=%7B%22d%22%3A+%22vnpt_qlts%22%2C+%22p%22%3A+4%2C+%22r%22%3A+%22http%253A%252F%252Fqlts.vnerp.vn%252Fweb%22%7D';

///
///------------Error Notification----------------
///
const ERROR_NOT_FOUND = 'Không tìm thấy tài sản tương ứng';
const EMPTY_SQFLITE = 'Không có dữ liệu kiểm kê offline';
const WRONG_QRCODE = 'Dữ liệu nhập vào không đúng!';
const LACK_OF_INVENTORY = 'Không có đợt kiểm kê';

///
/// -------------Tabbar title
///
const TABBAR_TITLE_QRCODE = 'QR Code';
const TABBAR_TITLE_INPUT = 'Tra cứu thông tin';
const TABBAR_TITLE_INVENTORY_HOME = 'Đợt kiểm kê';

///
/// ------Home Page-------
///
const TITLE_SEARCH = 'Tra cứu tài sản';
const TITLE_INVENTORY = 'Kiểm kê tài sản';

///
/// ---------Title-------
///
const SO_THE = 'Số thẻ';
