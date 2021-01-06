import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';

class InventoryMMTB {

  int idKqkk = -1;
  List<DataShow> listDataShow = [];

  InventoryMMTB.fromInventoryOffline(InventoryOffline inventoryOffline, List<DataVariantConfig> listDataVariantConfig) {

    this.idKqkk = inventoryOffline.idKqkk;

    listDataShow.add(getDataShow(listDataVariantConfig, 'so_the', inventoryOffline.soThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_the', inventoryOffline.tenThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_du_an', inventoryOffline.maDuAn) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_ts', inventoryOffline.loaiTs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'gia_tri', inventoryOffline.giaTri) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_so', inventoryOffline.maSo) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten', inventoryOffline.ten) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'so_luong', inventoryOffline.soLuong) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_vt_hh_dv', inventoryOffline.maVtHhDv) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'nuoc_sx', inventoryOffline.nuocSx) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_sx', inventoryOffline.namSx) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_su_dung', inventoryOffline.namSuDung) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'model', inventoryOffline.model) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'seri', inventoryOffline.seri) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'dia_diem', inventoryOffline.diaDiem) ?? DataShow());
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
    listDataShow.add(getDataShow(listDataVariantConfig, 'barcode', inventoryOffline.barCode) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ghi_chu', inventoryOffline.ghiChu) ?? DataShow());
  }

  InventoryMMTB();

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
// String soLuong;
//
// String maVtHhDv;
// String nuocSx;
// String namSx;
//
// String namSuDung;
//
// String model;
// String seri;
//
// String diaDiem;
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
// String barCode;
// String ghiChu;
//
// InventoryMMTB.fromMap(inventoryMMTB) {
//   idKqkk = inventoryMMTB['id_kqkk'];
//   stt = inventoryMMTB['stt'];
//   groupVariant = inventoryMMTB['group_variant'];
//   soThe = inventoryMMTB['so_the'];
//   tenThe = inventoryMMTB['ten_the'];
//   maDuAn = inventoryMMTB['ma_du_an'];
//   loaiTs = inventoryMMTB['loai_ts'];
//   giaTri = inventoryMMTB['gia_tri'];
//   maSo = inventoryMMTB['ma_so'];
//   ten = inventoryMMTB['ten'];
//   soLuong = inventoryMMTB['so_luong'];
//   maVtHhDv = inventoryMMTB['ma_vt_hh_dv'];
//   nuocSx = inventoryMMTB['nuoc_sx'];
//   namSx = inventoryMMTB['nam_sx'];
//   namSuDung = inventoryMMTB['nam_su_dung'];
//   model = inventoryMMTB['model'];
//   seri = inventoryMMTB['seri'];
//   diaDiem = inventoryMMTB['dia_diem'];
//   maTinhTrangSd = inventoryMMTB['ma_tinh_trang_sd'];
//   tenTinhTrangSd = inventoryMMTB['ten_tinh_trang_sd'];
//   maDviSd = inventoryMMTB['ma_dvi_sd'];
//   tenDviSd = inventoryMMTB['ten_dvi_sd'];
//   maPhong = inventoryMMTB['ma_phong'];
//   tenPhong = inventoryMMTB['ten_phong'];
//   maCsht = inventoryMMTB['ma_csht'];
//   tenCsht = inventoryMMTB['ten_csht'];
//   maNs = inventoryMMTB['ma_ns'];
//   tenNs = inventoryMMTB['ten_ns'];
//   qrCode = inventoryMMTB['qr_code'];
//   qrCodeGiaTri = inventoryMMTB['qr_code_gtri'];
//   barCode = inventoryMMTB['barcode'];
//   ghiChu = inventoryMMTB['ghi_chu'];
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
//   result.add(getDataShow(listDataVariantConfig, 'so_luong', soLuong) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'ma_vt_hh_dv', maVtHhDv) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'nuoc_sx', nuocSx) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'nam_sx', namSx) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'nam_su_dung', namSuDung) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'model', model) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'seri', seri) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'dia_diem', diaDiem) ?? DataShow());
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
//   result.add(getDataShow(listDataVariantConfig, 'barcode', barCode) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ghi_chu', ghiChu) ?? DataShow());
//
//   return result;
// }
//
// DataShow getDataShow(List<DataVariantConfig> listDataVariantConfig, String code, String value){
//   listDataVariantConfig.forEach((dataVariantConfig){
//     if(dataVariantConfig.code == code)
//       return DataShow(name: dataVariantConfig.name, type: dataVariantConfig.type, canUpdate: dataVariantConfig.canUpdate, giaTri: value);
//
//   });
//
//   return null;
// }


//"id_kqkk": 41502,
//                     "stt": 1,
//                     "group_variant": "MMTB",
//                     "so_the": "1041",
//                     "ten_the": "Hthống ch.sét đường nguồn Dĩ An",
//                     "ma_du_an": "42p0226",
//                     "loai_ts": "695",
//                     "gia_tri": "51343669.0",
//                     "ma_so": "1041.1",
//                     "ten": "Thiết bị cắt lọc sét",
//                     "so_luong": "1",
//                     "ma_vt_hh_dv": null,
//                     "nuoc_sx": "Đức",
//                     "nam_sx": "2002",
//                     "nam_su_dung": "2002",
//                     "model": "DEHN",
//                     "seri": null,
//                     "dia_diem": "Di-An_BDG",
//                     "ma_tinh_trang_sd": "10",
//                     "ten_tinh_trang_sd": null,
//                     "ma_dvi_sd": "07205",
//                     "ten_dvi_sd": "Trung tâm VT Dĩ An",
//                     "ma_phong": null,
//                     "ten_phong": null,
//                     "ma_csht": null,
//                     "ten_csht": null,
//                     "ma_ns": null,
//                     "ten_ns": null,
//                     "qr_code": "C",
//                     "qr_code_gtri": null,
//                     "barcode": null,
//                     "ghi_chu": null,
//
