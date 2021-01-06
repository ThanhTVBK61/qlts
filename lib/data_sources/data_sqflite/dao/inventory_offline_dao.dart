import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';
import 'package:qlts/data_sources/data_sqflite/dao/dao.dart';

class InventoryOfflineDao implements Dao<InventoryOffline> {
  final tableName = 'offline';
  final columnIdKqkk = 'idKqkk';
  final _columnStt = 'stt';
  final _columnGroupVariant = 'groupVariant';
  final _columnSoThe = 'soThe';
  final _columnTenThe = 'tenThe';
  final _columnLoaiCongTrinh = 'loaiCongTrinh';
  final _columnMaDuAn = 'maDuAn';
  final _columnLoaiTs = 'loaiTs';
  final _columnGiaTri = 'giaTri';
  final _columnMaSo = 'maSo';
  final _columnTen = 'ten';
  final _columnSoLuong = 'soLuong';
  final _columnNamXayDung = 'namXayDung';
  final _columnNamSuDung = 'namSuDung';
  final _columnSoTang = 'soTang';
  final _columnDienTichSan = 'dienTichSan';
  final _columnDiaDiem = 'diaDiem';
  final _columnMaTinhTrangSd = 'maTinhTrangSd';
  final _columnTenTinhTrangSd = 'tenTinhTrangSd';
  final _columnMaDviSd = 'maDviSd';
  final _columnTenDviSd = 'tenDviSd';
  final _columnMaPhong = 'maPhong';
  final _columnTenPhong = 'tenPhong';
  final _columnMaCsht = 'maCsht';
  final _columnTenCsht = 'tenCsht';
  final _columnMaNs = 'maNs';
  final _columnTenNs = 'tenNs';
  final _columnQrCode = 'qrCode';
  final _columnQrCodeGiaTri = 'qrCodeGiaTri';
  final _columnGhiChu = 'ghiChu';
  final _columnMaVtHhDv = 'maVtHhDv';
  final _columnNuocSx = 'nuocSx';
  final _columnNamSx = 'namSx';
  final _columnModel = 'model';
  final _columnSeri = 'seri';
  final _columnBarCode = 'barCode';
  final _columnBienKiemSoat = 'bienKiemSoat';
  final _columnXiLanh = 'xiLanh';
  final _columnCongSuat = 'congSuat';
  final _columnKmSuDung = 'kmSuDung';
  final _columnLoaiNhienLieu = 'loaiNhienLieu';
  final _columnSoKhungSoMay = 'soKhungSoMay';
  final _columnDiemDau = 'diemDau';
  final _columnDiemCuoi = 'diemCuoi';
  final _columnNamDauTu = 'namDauTu';
  final _columnDungLuongCapDoi = 'dungLuongCapDoi';
  final _columnDoDai = 'doDai';
  final _columnPhuongThucLapDat = 'phuongThucLapDat';
  final _columnKcNguon = 'kcNguon';
  final _columnIdKcNguon = 'idKcNguon';
  final _columnKcDich = 'kcDich';
  final _columnIdKcDich = 'idKcDich';
  final _columnDungLuongOng = 'dungLuongOng';
  final _columnDuongKinhOng = 'duongKinhOng';
  final _columnBeDau = 'beDau';
  final _columnIdBeDau = 'idBeDau';
  final _columnBeCuoi = 'beCuoi';
  final _columnIdBeCuoi = 'idBeCuoi';
  final _columnCotBeTongH6 = 'cotBeTongH6';
  final _columnCotBeTongH65 = 'cotBeTongH65';
  final _columnCotBeTongH7 = 'cotBeTongH7';
  final _columnCotBeTongH8 = 'cotBeTongH8';
  final _columnCotSat16 = 'cotSat16';
  final _columnCotSat17 = 'cotSat17';
  final _columnCotMuaDienLucH8 = 'cotMuaDienLucH8';
  final _columnCotMuaDienLucH10 = 'cotMuaDienLucH10';
  final _columnCotMuaDienLucH12 = 'cotMuaDienLucH12';
  final _columnLoaiKhac = 'loaiKhac';
  final _columnDiaChi = 'diaChi';
  final _columnLoaiCot = 'loaiCot';
  final _columnDoCao = 'doCao';
  final _columnKetCauThan = 'ketCauThan';
  final _columnKetCauMong = 'ketCauMong';

  @override
  String get createTableQuery => '''CREATE TABLE $tableName
              ($columnIdKqkk INTEGER PRIMARY KEY, 
              $_columnStt INTEGER,
              $_columnGroupVariant TEXT, 
$_columnSoThe TEXT, 
$_columnTenThe TEXT, 
$_columnLoaiCongTrinh TEXT, 
$_columnMaDuAn TEXT, 
$_columnLoaiTs TEXT, 
$_columnGiaTri TEXT, 
$_columnMaSo TEXT, 
$_columnTen TEXT, 
$_columnSoLuong TEXT, 
$_columnNamXayDung TEXT, 
$_columnNamSuDung TEXT, 
$_columnSoTang TEXT, 
$_columnDienTichSan TEXT, 
$_columnDiaDiem TEXT, 
$_columnMaTinhTrangSd TEXT, 
$_columnTenTinhTrangSd TEXT, 
$_columnMaDviSd TEXT, 
$_columnTenDviSd TEXT, 
$_columnMaPhong TEXT, 
$_columnTenPhong TEXT, 
$_columnMaCsht TEXT, 
$_columnTenCsht TEXT, 
$_columnMaNs TEXT, 
$_columnTenNs TEXT, 
$_columnQrCode TEXT, 
$_columnQrCodeGiaTri TEXT, 
$_columnGhiChu TEXT, 
$_columnMaVtHhDv TEXT, 
$_columnNuocSx TEXT, 
$_columnNamSx TEXT, 
$_columnModel TEXT, 
$_columnSeri TEXT, 
$_columnBarCode TEXT, 
$_columnBienKiemSoat TEXT, 
$_columnXiLanh TEXT, 
$_columnCongSuat TEXT, 
$_columnKmSuDung TEXT, 
$_columnLoaiNhienLieu TEXT, 
$_columnSoKhungSoMay TEXT, 
$_columnDiemDau TEXT, 
$_columnDiemCuoi TEXT, 
$_columnNamDauTu TEXT, 
$_columnDungLuongCapDoi TEXT, 
$_columnDoDai TEXT, 
$_columnPhuongThucLapDat TEXT, 
$_columnKcNguon TEXT, 
$_columnIdKcNguon TEXT, 
$_columnKcDich TEXT, 
$_columnIdKcDich TEXT, 
$_columnDungLuongOng TEXT, 
$_columnDuongKinhOng TEXT, 
$_columnBeDau TEXT, 
$_columnIdBeDau TEXT, 
$_columnBeCuoi TEXT, 
$_columnIdBeCuoi TEXT, 
$_columnCotBeTongH6 TEXT, 
$_columnCotBeTongH65 TEXT, 
$_columnCotBeTongH7 TEXT, 
$_columnCotBeTongH8 TEXT, 
$_columnCotSat16 TEXT, 
$_columnCotSat17 TEXT, 
$_columnCotMuaDienLucH8 TEXT, 
$_columnCotMuaDienLucH10 TEXT, 
$_columnCotMuaDienLucH12 TEXT, 
$_columnLoaiKhac TEXT, 
$_columnDiaChi TEXT, 
$_columnLoaiCot TEXT, 
$_columnDoCao TEXT, 
$_columnKetCauThan TEXT, 
$_columnKetCauMong TEXT
        )''';

  @override
  List<InventoryOffline> fromList(List<Map<String, dynamic>> query) {
    List<InventoryOffline> listInventoryOffline = List<InventoryOffline>();
    for (Map map in query) {
      listInventoryOffline.add(fromMap(map));
    }
    return listInventoryOffline;
  }

  @override
  InventoryOffline fromMap(Map<String, dynamic> query) {
    InventoryOffline inventoryOffline = InventoryOffline();
    inventoryOffline.idKqkk = query[columnIdKqkk];
    inventoryOffline.stt = query[_columnStt];
    inventoryOffline.groupVariant = query[_columnGroupVariant];
    inventoryOffline.soThe = query[_columnSoThe];
    inventoryOffline.tenThe = query[_columnTenThe];
    inventoryOffline.loaiCongTrinh = query[_columnLoaiCongTrinh];
    inventoryOffline.maDuAn = query[_columnMaDuAn];
    inventoryOffline.loaiTs = query[_columnLoaiTs];
    inventoryOffline.giaTri = query[_columnGiaTri];
    inventoryOffline.maSo = query[_columnMaSo];
    inventoryOffline.ten = query[_columnTen];
    inventoryOffline.soLuong = query[_columnSoLuong];
    inventoryOffline.namXayDung = query[_columnNamXayDung];
    inventoryOffline.namSuDung = query[_columnNamSuDung];
    inventoryOffline.soTang = query[_columnSoTang];
    inventoryOffline.dienTichSan = query[_columnDienTichSan];
    inventoryOffline.diaDiem = query[_columnDiaDiem];
    inventoryOffline.maTinhTrangSd = query[_columnMaTinhTrangSd];
    inventoryOffline.tenTinhTrangSd = query[_columnTenTinhTrangSd];
    inventoryOffline.maDviSd = query[_columnMaDviSd];
    inventoryOffline.tenDviSd = query[_columnTenDviSd];
    inventoryOffline.maPhong = query[_columnMaPhong];
    inventoryOffline.tenPhong = query[_columnTenPhong];
    inventoryOffline.maCsht = query[_columnMaCsht];
    inventoryOffline.tenCsht = query[_columnTenCsht];
    inventoryOffline.maNs = query[_columnMaNs];
    inventoryOffline.tenNs = query[_columnTenNs];
    inventoryOffline.qrCode = query[_columnQrCode];
    inventoryOffline.qrCodeGiaTri = query[_columnQrCodeGiaTri];
    inventoryOffline.ghiChu = query[_columnGhiChu];
    inventoryOffline.maVtHhDv = query[_columnMaVtHhDv];
    inventoryOffline.nuocSx = query[_columnNuocSx];
    inventoryOffline.namSx = query[_columnNamSx];
    inventoryOffline.model = query[_columnModel];
    inventoryOffline.seri = query[_columnSeri];
    inventoryOffline.barCode = query[_columnBarCode];
    inventoryOffline.bienKiemSoat = query[_columnBienKiemSoat];
    inventoryOffline.xiLanh = query[_columnXiLanh];
    inventoryOffline.congSuat = query[_columnCongSuat];
    inventoryOffline.kmSuDung = query[_columnKmSuDung];
    inventoryOffline.loaiNhienLieu = query[_columnLoaiNhienLieu];
    inventoryOffline.soKhungSoMay = query[_columnSoKhungSoMay];
    inventoryOffline.diemDau = query[_columnDiemDau];
    inventoryOffline.diemCuoi = query[_columnDiemCuoi];
    inventoryOffline.namDauTu = query[_columnNamDauTu];
    inventoryOffline.dungLuongCapDoi = query[_columnDungLuongCapDoi];
    inventoryOffline.doDai = query[_columnDoDai];
    inventoryOffline.phuongThucLapDat = query[_columnPhuongThucLapDat];
    inventoryOffline.kcNguon = query[_columnKcNguon];
    inventoryOffline.idKcNguon = query[_columnIdKcNguon];
    inventoryOffline.kcDich = query[_columnKcDich];
    inventoryOffline.idKcDich = query[_columnIdKcDich];
    inventoryOffline.dungLuongOng = query[_columnDungLuongOng];
    inventoryOffline.duongKinhOng = query[_columnDuongKinhOng];
    inventoryOffline.beDau = query[_columnBeDau];
    inventoryOffline.idBeDau = query[_columnIdBeDau];
    inventoryOffline.beCuoi = query[_columnBeCuoi];
    inventoryOffline.idBeCuoi = query[_columnIdBeCuoi];
    inventoryOffline.cotBeTongH6 = query[_columnCotBeTongH6];
    inventoryOffline.cotBeTongH65 = query[_columnCotBeTongH65];
    inventoryOffline.cotBeTongH7 = query[_columnCotBeTongH7];
    inventoryOffline.cotBeTongH8 = query[_columnCotBeTongH8];
    inventoryOffline.cotSat16 = query[_columnCotSat16];
    inventoryOffline.cotSat17 = query[_columnCotSat17];
    inventoryOffline.cotMuaDienLucH8 = query[_columnCotMuaDienLucH8];
    inventoryOffline.cotMuaDienLucH10 = query[_columnCotMuaDienLucH10];
    inventoryOffline.cotMuaDienLucH12 = query[_columnCotMuaDienLucH12];
    inventoryOffline.loaiKhac = query[_columnLoaiKhac];
    inventoryOffline.diaChi = query[_columnDiaChi];
    inventoryOffline.loaiCot = query[_columnLoaiCot];
    inventoryOffline.doCao = query[_columnDoCao];
    inventoryOffline.ketCauThan = query[_columnKetCauThan];
    inventoryOffline.ketCauMong = query[_columnKetCauMong];

    return inventoryOffline;
  }

  @override
  Map<String, dynamic> toMap(InventoryOffline object) {
    return <String, dynamic>{
      columnIdKqkk: object.idKqkk,
      _columnStt: object.stt,
      _columnGroupVariant: object.groupVariant ?? '',
      _columnSoThe: object.soThe ?? '',
      _columnTenThe: object.tenThe ?? '',
      _columnLoaiCongTrinh: object.loaiCongTrinh ?? '',
      _columnMaDuAn: object.maDuAn ?? '',
      _columnLoaiTs: object.loaiTs ?? '',
      _columnGiaTri: object.giaTri ?? '',
      _columnMaSo: object.maSo ?? '',
      _columnTen: object.ten ?? '',
      _columnSoLuong: object.soLuong ?? '',
      _columnNamXayDung: object.namXayDung ?? '',
      _columnNamSuDung: object.namSuDung ?? '',
      _columnSoTang: object.soTang ?? '',
      _columnDienTichSan: object.dienTichSan ?? '',
      _columnDiaDiem: object.diaDiem ?? '',
      _columnMaTinhTrangSd: object.maTinhTrangSd ?? '',
      _columnTenTinhTrangSd: object.tenTinhTrangSd ?? '',
      _columnMaDviSd: object.maDviSd ?? '',
      _columnTenDviSd: object.tenDviSd ?? '',
      _columnMaPhong: object.maPhong ?? '',
      _columnTenPhong: object.tenPhong ?? '',
      _columnMaCsht: object.maCsht ?? '',
      _columnTenCsht: object.tenCsht ?? '',
      _columnMaNs: object.maNs ?? '',
      _columnTenNs: object.tenNs ?? '',
      _columnQrCode: object.qrCode ?? '',
      _columnQrCodeGiaTri: object.qrCodeGiaTri ?? '',
      _columnGhiChu: object.ghiChu ?? '',
      _columnMaVtHhDv: object.maVtHhDv ?? '',
      _columnNuocSx: object.nuocSx ?? '',
      _columnNamSx: object.namSx ?? '',
      _columnModel: object.model ?? '',
      _columnSeri: object.seri ?? '',
      _columnBarCode: object.barCode ?? '',
      _columnBienKiemSoat: object.bienKiemSoat ?? '',
      _columnXiLanh: object.xiLanh ?? '',
      _columnCongSuat: object.congSuat ?? '',
      _columnKmSuDung: object.kmSuDung ?? '',
      _columnLoaiNhienLieu: object.loaiNhienLieu ?? '',
      _columnSoKhungSoMay: object.soKhungSoMay ?? '',
      _columnDiemDau: object.diemDau ?? '',
      _columnDiemCuoi: object.diemCuoi ?? '',
      _columnNamDauTu: object.namDauTu ?? '',
      _columnDungLuongCapDoi: object.dungLuongCapDoi ?? '',
      _columnDoDai: object.doDai ?? '',
      _columnPhuongThucLapDat: object.phuongThucLapDat ?? '',
      _columnKcNguon: object.kcNguon ?? '',
      _columnIdKcNguon: object.idKcNguon ?? '',
      _columnKcDich: object.kcDich ?? '',
      _columnIdKcDich: object.idKcDich ?? '',
      _columnDungLuongOng: object.dungLuongOng ?? '',
      _columnDuongKinhOng: object.duongKinhOng ?? '',
      _columnBeDau: object.beDau ?? '',
      _columnIdBeDau: object.idBeDau ?? '',
      _columnBeCuoi: object.beCuoi ?? '',
      _columnIdBeCuoi: object.idBeCuoi ?? '',
      _columnCotBeTongH6: object.cotBeTongH6 ?? '',
      _columnCotBeTongH65: object.cotBeTongH65 ?? '',
      _columnCotBeTongH7: object.cotBeTongH7 ?? '',
      _columnCotBeTongH8: object.cotBeTongH8 ?? '',
      _columnCotSat16: object.cotSat16 ?? '',
      _columnCotSat17: object.cotSat17 ?? '',
      _columnCotMuaDienLucH8: object.cotMuaDienLucH8 ?? '',
      _columnCotMuaDienLucH10: object.cotMuaDienLucH10 ?? '',
      _columnCotMuaDienLucH12: object.cotMuaDienLucH12 ?? '',
      _columnLoaiKhac: object.loaiKhac ?? '',
      _columnDiaChi: object.diaChi ?? '',
      _columnLoaiCot: object.loaiCot ?? '',
      _columnDoCao: object.doCao ?? '',
      _columnKetCauThan: object.ketCauThan ?? '',
      _columnKetCauMong: object.ketCauMong ?? ''
    };
  }

  List<Map> toListUpload(List<Map<String, dynamic>> query){
    List<Map> data = [];
    for(Map map in query){
      data.add(fromMapUpload(map));
    }

    return data;
  }

  Map<String, dynamic> fromMapUpload(Map<String, dynamic> query){
    return <String, dynamic>{
      'id_kqkk': query[columnIdKqkk],
      'stt': query[_columnStt],
      'group_variant': query[_columnGroupVariant],
      'so_the': query[_columnSoThe],
      'ten_the': query[_columnTenThe],
      'loai_cong_trinh': query[_columnLoaiCongTrinh],
      'ma_du_an': query[_columnMaDuAn],
      'loai_ts': query[_columnLoaiTs],
      'gia_tri': query[_columnGiaTri],
      'ma_so': query[_columnMaSo],
      'ten': query[_columnTen],
      'so_luong': query[_columnSoLuong],
      'nam_xay_dung': query[_columnNamXayDung],
      'nam_su_dung': query[_columnNamSuDung],
      'so_tang': query[_columnSoTang],
      'dien_tich_san': query[_columnDienTichSan],
      'dia_diem': query[_columnDiaDiem],
      'ma_tinh_trang_sd': query[_columnMaTinhTrangSd],
      'ten_tinh_trang_sd': query[_columnTenTinhTrangSd],
      'ma_dvi_sd': query[_columnMaDviSd],
      'ten_dvi_sd': query[_columnTenTinhTrangSd],
      'ma_phong': query[_columnMaPhong],
      'ten_phong': query[_columnTenPhong],
      'ma_csht': query[_columnMaCsht],
      'ten_csht': query[_columnTenCsht],
      'ma_ns': query[_columnMaNs],
      'ten_ns': query[_columnTenNs],
      'qr_code': query[_columnQrCode],
      'qr_code_gtri': query[_columnQrCodeGiaTri],
      'ghi_chu': query[_columnGhiChu],
      'ma_vt_hh_dv': query[_columnMaVtHhDv],
      'nuoc_sx': query[_columnNuocSx],
      'nam_sx': query[_columnNamSx],
      'model': query[_columnModel],
      'seri': query[_columnSeri],
      'barcode': query[_columnBarCode],
      'bien_kiem_soat': query[_columnBienKiemSoat],
      'xi_lanh': query[_columnXiLanh],
      'cong_suat': query[_columnCongSuat],
      'km_su_dung': query[_columnKmSuDung],
      'loai_nhien_lieu': query[_columnLoaiNhienLieu],
      'so_khung_so_may': query[_columnSoKhungSoMay],
      'diem_dau': query[_columnDiemDau],
      'diem_cuoi': query[_columnDiemCuoi],
      'nam_dau_tu': query[_columnNamDauTu],
      'dung_luong_cap_doi': query[_columnDungLuongCapDoi],
      'do_dai': query[_columnDoDai],
      'phuong_thuc_lap_dat': query[_columnPhuongThucLapDat],
      'kc_nguon': query[_columnKcNguon],
      'id_kc_nguon': query[_columnIdKcNguon],
      'kc_dich': query[_columnKcDich],
      'id_kc_dich': query[_columnIdKcDich],
      'dung_luong_ong': query[_columnDungLuongOng],
      'duong_kinh_ong': query[_columnDuongKinhOng],
      'be_dau': query[_columnBeDau],
      'id_be_dau': query[_columnIdBeDau],
      'be_cuoi': query[_columnBeCuoi],
      'id_be_cuoi': query[_columnIdBeCuoi],
      'cot_be_tong_h6': query[_columnCotBeTongH6],
      'cot_be_tong_h6_5': query[_columnCotBeTongH65],
      'cot_be_tong_h7': query[_columnCotBeTongH7],
      'cot_be_tong_h8': query[_columnCotBeTongH8],
      'cot_sat_16': query[_columnCotSat16],
      'cot_sat_17': query[_columnCotSat17],
      'cot_mua_dien_luc_h8': query[_columnCotMuaDienLucH8],
      'cot_mua_dien_luc_h10': query[_columnCotMuaDienLucH10],
      'cot_mua_dien_luc_h12': query[_columnCotMuaDienLucH12],
      'loai_khac': query[_columnLoaiKhac],
      'dia_chi': query[_columnDiaChi],
      'loai_cot': query[_columnLoaiCot],
      'do_cao': query[_columnDoCao],
      'ket_cau_than': query[_columnKetCauThan],
      'ket_cau_mong': query[_columnKetCauMong],
    };
  }

}
