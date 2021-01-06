import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';

class InventoryCAPDCAPQ{

  int idKqkk = -1;
  List<DataShow> listDataShow = [];

  InventoryCAPDCAPQ.fromInventoryOffline(InventoryOffline inventoryOffline, List<DataVariantConfig> listDataVariantConfig){

    this.idKqkk = inventoryOffline.idKqkk;

    listDataShow.add(getDataShow(listDataVariantConfig, 'so_the', inventoryOffline.soThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_the', inventoryOffline.tenThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_du_an', inventoryOffline.maDuAn) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_ts', inventoryOffline.loaiTs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'gia_tri', inventoryOffline.giaTri) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_so', inventoryOffline.maSo) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten', inventoryOffline.ten) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'diem_dau', inventoryOffline.diemDau) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'diem_cuoi', inventoryOffline.diemCuoi) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_dau_tu', inventoryOffline.namDauTu) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_su_dung', inventoryOffline.namSuDung) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'dung_luong_cap_doi', inventoryOffline.dungLuongCapDoi) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'do_dai', inventoryOffline.doDai) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'phuong_thuc_lap_dat', inventoryOffline.phuongThucLapDat) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'kc_nguon', inventoryOffline.kcNguon) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'id_kc_nguon', inventoryOffline.idKcNguon) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'kc_dich', inventoryOffline.kcDich) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'id_kc_dich', inventoryOffline.idKcDich) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'so_luong', inventoryOffline.soLuong) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_tinh_trang_sd', inventoryOffline.maTinhTrangSd) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_tinh_trang_sd', inventoryOffline.tenTinhTrangSd) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_dvi_sd', inventoryOffline.maDviSd) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_dvi_sd', inventoryOffline.tenDviSd) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_phong', inventoryOffline.maPhong) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_phong', inventoryOffline.tenPhong) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_csht', inventoryOffline.maCsht) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_csht', inventoryOffline.tenCsht) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_ns', inventoryOffline.maNs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_ns', inventoryOffline.tenNs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'qr_code', inventoryOffline.qrCode) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'qr_code_gtri', inventoryOffline.qrCodeGiaTri) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ghi_chu', inventoryOffline.ghiChu) ?? DataShow());
  }

  InventoryCAPDCAPQ();

}

// int idKqkk;
// int stt;
// String groupVariant;
// String soThe;
// String tenThe;
// String maDuAn;
// String loaiTs;
// String giaTri;
// String maSo;
// String ten;
//
// String diemDau;
// String diemCuoi;
// String namDauTu;
//
// String namSuDung;
//
// String dungLuongCapDoi;
// String doDai;
// String phuongThucLapDat;
// String kcNguon;
// String idKcNguon;
// String kcDich;
// String idKcDich;
//
// String soLuong;
// String maTinhTrangSd;
// String tenTinhTrangSd;
// String maDviSd;
// String tenDviSd;
// String maPhong;
// String tenPhong;
// String maCsht;
// String tenCsht;
// String maNs;
// String tenNs;
// String qrCode;
// String qrCodeGiaTri;
// String ghiChu;
//
// InventoryCAPDCAPQ.fromMap(inventoryCAPD){
//   idKqkk = inventoryCAPD['id_kqkk'];
//   stt = inventoryCAPD['stt'];
//   groupVariant = inventoryCAPD['group_variant'];
//   soThe = inventoryCAPD['so_the'];
//   tenThe = inventoryCAPD['ten_the'];
//   maDuAn = inventoryCAPD['ma_du_an'];
//   loaiTs = inventoryCAPD['loai_ts'];
//   giaTri = inventoryCAPD['gia_tri'];
//   maSo = inventoryCAPD['ma_so'];
//   ten = inventoryCAPD['ten'];
//
//   diemDau = inventoryCAPD['diem_dau'];
//   diemCuoi = inventoryCAPD['diem_cuoi'];
//   namDauTu = inventoryCAPD['nam_dau_tu'];
//
//   namSuDung = inventoryCAPD['nam_su_dung'];
//
//   dungLuongCapDoi = inventoryCAPD['dung_luong_cap_doi'];
//   doDai = inventoryCAPD['do_dai'];
//   phuongThucLapDat = inventoryCAPD['phuong_thuc_lap_dat'];
//   kcNguon = inventoryCAPD['kc_nguon'];
//   idKcNguon = inventoryCAPD['id_kc_nguon'];
//   kcDich = inventoryCAPD['kc_dich'];
//   idKcDich = inventoryCAPD['id_kc_dich'];
//
//   soLuong = inventoryCAPD['so_luong'];
//   maTinhTrangSd = inventoryCAPD['ma_tinh_trang_sd'];
//   tenTinhTrangSd = inventoryCAPD['ten_tinh_trang_sd'];
//   maDviSd = inventoryCAPD['ma_dvi_sd'];
//   tenDviSd = inventoryCAPD['ten_dvi_sd'];
//   maPhong = inventoryCAPD['ma_phong'];
//   tenPhong = inventoryCAPD['ten_phong'];
//   maCsht = inventoryCAPD['ma_csht'];
//   tenCsht = inventoryCAPD['ten_csht'];
//   maNs = inventoryCAPD['ma_ns'];
//   tenNs = inventoryCAPD['ten_ns'];
//   qrCode = inventoryCAPD['qr_code'];
//   qrCodeGiaTri = inventoryCAPD['qr_code_gtri'];
//   ghiChu = inventoryCAPD['ghi_chu'];
// }


// List<DataShow> listDataShow(List<DataVariantConfig> listDataVariantConfig){
//   List<DataShow> result = [];
//   result.add(getDataShow(listDataVariantConfig, 'so_the', soThe) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_the', tenThe) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_du_an', maDuAn) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'loai_ts', loaiTs) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'gia_tri', giaTri) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_so', maSo) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten', ten) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'diem_dau', diemDau) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'diem_cuoi', diemCuoi) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'nam_dau_tu', namDauTu) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'nam_su_dung', namSuDung) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'dung_luong_cap_doi', dungLuongCapDoi) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'do_dai', doDai) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'phuong_thuc_lap_dat', phuongThucLapDat) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'kc_nguon', kcNguon) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'id_kc_nguon', idKcNguon) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'kc_dich', kcDich) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'id_kc_dich', idKcDich) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'so_luong', soLuong) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_tinh_trang_sd', maTinhTrangSd) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_tinh_trang_sd', tenTinhTrangSd) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_dvi_sd', maDviSd) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_dvi_sd', tenDviSd) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_phong', maPhong) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_phong', tenPhong) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_csht', maCsht) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_csht', tenCsht) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_ns', maNs) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_ns', tenNs) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'qr_code', qrCode) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'qr_code_gtri', qrCodeGiaTri) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ghi_chu', ghiChu) ?? DataShow());
//
//   return result;
// }

// DataShow getDataShow(List<DataVariantConfig> listDataVariantConfig, String code, String value){
//   listDataVariantConfig.forEach((dataVariantConfig){
//     if(dataVariantConfig.code == code)
//       return DataShow(name: dataVariantConfig.name, type: dataVariantConfig.type, canUpdate: dataVariantConfig.canUpdate, giaTri: value);
//
//   });
//
//   return null;
// }


// "id_kqkk": 44615,
// "stt": 1,
// "group_variant": "CAPD",
// "so_the": "1020",
// "ten_the": "MR MC nội hạt Huyện Phú Giáo",
// "ma_du_an": "42P0117",
// "loai_ts": "423",
// "gia_tri": null,
// "ma_so": "7190",
// "ten": null,
//
// "diem_dau": "cuối đường số 6 F2",
// "diem_cuoi": "N3 Cty OVal",
// "nam_dau_tu": null,
//
// "nam_su_dung": "2002",
//
// "dung_luong_cap_doi": "100x2x0,5",
// "do_dai": null,
// "phuong_thuc_lap_dat": "Cáp ngầm",
// "kc_nguon": null,
// "id_kc_nguon": null,
// "kc_dich": null,
// "id_kc_dich": null,
//
// "so_luong": "1",
// "ma_tinh_trang_sd": "10",
// "ten_tinh_trang_sd": null,
// "ma_dvi_sd": "07205",
// "ten_dvi_sd": "Trung tâm VT Dĩ An",
// "ma_phong": null,
// "ten_phong": null,
// "ma_csht": null,
// "ten_csht": null,
// "ma_ns": null,
// "ten_ns": null,
// "qr_code": "C",
// "qr_code_gtri": null,
// "ghi_chu": null,