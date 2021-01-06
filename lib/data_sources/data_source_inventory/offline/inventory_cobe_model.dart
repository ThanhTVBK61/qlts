import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';

class InventoryCOBE{

  int idKqkk = -1;
  List<DataShow> listDataShow = [];

  InventoryCOBE.fromInventoryOffline(InventoryOffline inventoryOffline, List<DataVariantConfig> listDataVariantConfig){

    this.idKqkk = inventoryOffline.idKqkk;

    listDataShow.add(getDataShow(listDataVariantConfig, 'so_the', inventoryOffline.soThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_the', inventoryOffline.tenThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_du_an', inventoryOffline.maDuAn) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_ts', inventoryOffline.loaiTs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'gia_tri', inventoryOffline.giaTri) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_so', inventoryOffline.maSo) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten', inventoryOffline.ten) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_su_dung', inventoryOffline.namSuDung) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_dau_tu', inventoryOffline.namDauTu) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'do_dai', inventoryOffline.doDai) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'dung_luong_ong', inventoryOffline.dungLuongOng) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'duong_kinh_ong', inventoryOffline.duongKinhOng) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'be_dau', inventoryOffline.beDau) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'id_be_dau', inventoryOffline.idBeDau) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'be_cuoi', inventoryOffline.beCuoi) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'id_be_cuoi', inventoryOffline.idBeCuoi) ?? DataShow());

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

  InventoryCOBE();

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
// String namDauTu;
// String namSuDung;
//
// String doDai;
//
// String dungLuongOng;
// String duongKinhOng;
// String beDau;
// String idBeDau;
// String beCuoi;
// String idBeCuoi;
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
//
// InventoryCOBE.fromMap(inventoryCOBE){
//   idKqkk = inventoryCOBE['id_kqkk'];
//   stt = inventoryCOBE['stt'];
//   groupVariant = inventoryCOBE['group_variant'];
//   soThe = inventoryCOBE['so_the'];
//   tenThe = inventoryCOBE['ten_the'];
//   maDuAn = inventoryCOBE['ma_du_an'];
//   loaiTs = inventoryCOBE['loai_ts'];
//   giaTri = inventoryCOBE['gia_tri'];
//   maSo = inventoryCOBE['ma_so'];
//   ten = inventoryCOBE['ten'];
//
//   namDauTu = inventoryCOBE['nam_dau_tu'];
//   namSuDung = inventoryCOBE['nam_su_dung'];
//
//   doDai = inventoryCOBE['do_dai'];
//
//   dungLuongOng = inventoryCOBE['dung_luong_ong'];
//   duongKinhOng = inventoryCOBE['duong_kinh_ong'];
//   beDau = inventoryCOBE['be_dau'];
//   idBeDau = inventoryCOBE['id_be_dau'];
//   beCuoi = inventoryCOBE['be_cuoi'];
//   idBeCuoi = inventoryCOBE['id_be_cuoi'];
//
//   maTinhTrangSd = inventoryCOBE['ma_tinh_trang_sd'];
//   tenTinhTrangSd = inventoryCOBE['ten_tinh_trang_sd'];
//   maDviSd = inventoryCOBE['ma_dvi_sd'];
//   tenDviSd = inventoryCOBE['ten_dvi_sd'];
//   maPhong = inventoryCOBE['ma_phong'];
//   tenPhong = inventoryCOBE['ten_phong'];
//   maCsht = inventoryCOBE['ma_csht'];
//   tenCsht = inventoryCOBE['ten_csht'];
//   maNs = inventoryCOBE['ma_ns'];
//   tenNs = inventoryCOBE['ten_ns'];
//   qrCode = inventoryCOBE['qr_code'];
//   qrCodeGiaTri = inventoryCOBE['qr_code_gtri'];
//   ghiChu = inventoryCOBE['ghi_chu'];
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
//   result.add(getDataShow(listDataVariantConfig, 'nam_su_dung', namSuDung) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'nam_dau_tu', namDauTu) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'do_dai', doDai) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'dung_luong_ong' ,dungLuongOng) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'duong_kinh_ong' ,duongKinhOng) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'be_dau' ,beDau) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'id_be_dau' ,idBeDau) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'be_cuoi' ,beCuoi) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'id_be_cuoi' ,idBeCuoi) ?? DataShow());
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


/*"id_kqkk": 43491,
                    "stt": 1,
                    "group_variant": "COBE",
                    "so_the": "1047.1",
                    "ten_the": "XD mạng cống bể khu chung cư HDAn",
                    "ma_du_an": "42P0208",
                    "loai_ts": "693",
                    "gia_tri": null,
                    "ma_so": "13491",
                    "ten": null,

                    "nam_dau_tu": "2002",
                    "nam_su_dung": "2002",

                    "do_dai": null,

                    "dung_luong_ong": "0",
                    "duong_kinh_ong": null,
                    "be_dau": null,
                    "id_be_dau": null,
                    "be_cuoi": null,
                    "id_be_cuoi": null,

                    "ma_tinh_trang_sd": "10",
                    "ten_tinh_trang_sd": null,
                    "ma_dvi_sd": "07205",
                    "ten_dvi_sd": "Trung tâm VT Dĩ An",
                    "ma_phong": null,
                    "ten_phong": null,
                    "ma_csht": null,
                    "ten_csht": null,
                    "ma_ns": null,
                    "ten_ns": null,
                    "qr_code": "K",
                    "qr_code_gtri": null,
                    "ghi_chu": null,
                    */