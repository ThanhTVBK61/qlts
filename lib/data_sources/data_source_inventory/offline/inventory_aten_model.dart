import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';

class InventoryATEN {

  int idKqkk = -1;
  List<DataShow> listDataShow = [];

  InventoryATEN.fromInventoryOffline(InventoryOffline inventoryOffline, List<DataVariantConfig> listDataVariantConfig) {

    this.idKqkk = inventoryOffline.idKqkk;

    listDataShow.add(getDataShow(listDataVariantConfig, 'so_the', inventoryOffline.soThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_the', inventoryOffline.tenThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_du_an', inventoryOffline.maDuAn) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_ts', inventoryOffline.loaiTs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'gia_tri', inventoryOffline.giaTri) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_so', inventoryOffline.maSo) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten', inventoryOffline.ten) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'dia_chi', inventoryOffline.diaChi) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_dau_tu', inventoryOffline.namDauTu) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_su_dung', inventoryOffline.namSuDung) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_cot', inventoryOffline.loaiCot) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'co_cao', inventoryOffline.doCao) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ket_cau_than', inventoryOffline.ketCauThan) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ket_cau_mong', inventoryOffline.ketCauMong) ?? DataShow());

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

  InventoryATEN();

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
// String diaChi;
//
// String namDauTu;
// String namSuDung;
//
// String loaiCot;
// String doCao;
// String ketCauThan;
// String ketCauMong;
//
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

// InventoryATEN.fromMap(inventoryATEN) {
//   idKqkk = inventoryATEN['id_kqkk'];
//   stt = inventoryATEN['stt'];
//   groupVariant = inventoryATEN['group_variant'];
//   soThe = inventoryATEN['so_the'];
//   tenThe = inventoryATEN['ten_the'];
//   maDuAn = inventoryATEN['ma_du_an'];
//   loaiTs = inventoryATEN['loai_ts'];
//   giaTri = inventoryATEN['gia_tri'];
//   maSo = inventoryATEN['ma_so'];
//   ten = inventoryATEN['ten'];
//
//   diaChi = inventoryATEN['dia_chi'];
//
//   namDauTu = inventoryATEN['nam_dau_tu'];
//   namSuDung = inventoryATEN['nam_su_dung'];
//
//   loaiCot = inventoryATEN['loai_cot'];
//   doCao = inventoryATEN['do_cao'];
//   ketCauThan = inventoryATEN['ket_cau_than'];
//   ketCauMong = inventoryATEN['ket_cau_mong'];
//
//   maTinhTrangSd = inventoryATEN['ma_tinh_trang_sd'];
//   tenTinhTrangSd = inventoryATEN['ten_tinh_trang_sd'];
//   maDviSd = inventoryATEN['ma_dvi_sd'];
//   tenDviSd = inventoryATEN['ten_dvi_sd'];
//   maPhong = inventoryATEN['ma_phong'];
//   tenPhong = inventoryATEN['ten_phong'];
//   maCsht = inventoryATEN['ma_csht'];
//   tenCsht = inventoryATEN['ten_csht'];
//   maNs = inventoryATEN['ma_ns'];
//   tenNs = inventoryATEN['ten_ns'];
//   qrCode = inventoryATEN['qr_code'];
//   qrCodeGiaTri = inventoryATEN['qr_code_gtri'];
//   ghiChu = inventoryATEN['ghi_chu'];
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
//   result.add(getDataShow(listDataVariantConfig, '', diaChi) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'nam_dau_tu', namDauTu) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'nam_su_dung', namSuDung) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'loai_cot', loaiCot) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'co_cao', doCao) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ket_cau_than', ketCauThan) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ket_cau_mong', ketCauMong) ?? DataShow());
//
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


// "id_kqkk": 44050,
// "stt": 1,
// "group_variant": "ATEN",
// "so_the": "1549",
// "ten_the": "Trụ Anten tự đứng 49m Tân Đ Hiệp",
// "ma_du_an": "42P0422",
// "loai_ts": "6911",
// "gia_tri": "293518023.0",
// "ma_so": "9",
// "ten": null,
//
// "dia_chi": null,
//
// "nam_dau_tu": "2013",
// "nam_su_dung": "2013",
//
// "loai_cot": "Tự đứng",
// "do_cao": "49",
// "ket_cau_than": "Cột tam giác, thép hình mạ kẽm",
// "ket_cau_mong": null,
//
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
