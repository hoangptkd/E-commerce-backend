package com.example.mmo_shop.dao.model.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonCreator;
import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "Addresses")
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @OneToOne()
    @JoinColumn(name = "user_id",referencedColumnName = "id")
    @JsonBackReference(value = "user_address")
    private User user;
    private String street;
    private String district;
    private String city;



    public enum CityEnum {
        AN_GIANG("An Giang"),
        BA_RIA_VUNG_TAU("Bà Rịa - Vũng Tàu"),
        BAC_LIEU("Bạc Liêu"),
        BAC_KAN("Bắc Kạn"),
        BAC_GIANG("Bắc Giang"),
        BAC_NINH("Bắc Ninh"),
        BEN_TRE("Bến Tre"),
        BINH_DINH("Bình Định"),
        BINH_DUONG("Bình Dương"),
        BINH_PHUOC("Bình Phước"),
        BINH_THUAN("Bình Thuận"),
        CA_MAU("Cà Mau"),
        CAO_BANG("Cao Bằng"),
        CAN_THO("Cần Thơ"),
        DA_NANG("Đà Nẵng"),
        DAK_LAK("Đắk Lắk"),
        DAK_NONG("Đắk Nông"),
        DIEN_BIEN("Điện Biên"),
        DONG_NAI("Đồng Nai"),
        DONG_THAP("Đồng Tháp"),
        GIA_LAI("Gia Lai"),
        HA_GIANG("Hà Giang"),
        HA_NAM("Hà Nam"),
        HA_NOI("Hà Nội"),
        HA_TINH("Hà Tĩnh"),
        HAI_DUONG("Hải Dương"),
        HAI_PHONG("Hải Phòng"),
        HAU_GIANG("Hậu Giang"),
        HOA_BINH("Hòa Bình"),
        HUNG_YEN("Hưng Yên"),
        KHANH_HOA("Khánh Hòa"),
        KIEN_GIANG("Kiên Giang"),
        KON_TUM("Kon Tum"),
        LAI_CHAU("Lai Châu"),
        LANG_SON("Lạng Sơn"),
        LAO_CAI("Lào Cai"),
        LAM_DONG("Lâm Đồng"),
        LONG_AN("Long An"),
        NAM_DINH("Nam Định"),
        NGHE_AN("Nghệ An"),
        NINH_BINH("Ninh Bình"),
        NINH_THUAN("Ninh Thuận"),
        PHU_THO("Phú Thọ"),
        PHU_YEN("Phú Yên"),
        QUANG_BINH("Quảng Bình"),
        QUANG_NAM("Quảng Nam"),
        QUANG_NGAI("Quảng Ngãi"),
        QUANG_NINH("Quảng Ninh"),
        QUANG_TRI("Quảng Trị"),
        SOC_TRANG("Sóc Trăng"),
        SON_LA("Sơn La"),
        TAY_NINH("Tây Ninh"),
        THAI_BINH("Thái Bình"),
        THAI_NGUYEN("Thái Nguyên"),
        THANH_HOA("Thanh Hóa"),
        THUA_THIEN_HUE("Thừa Thiên Huế"),
        TIEN_GIANG("Tiền Giang"),
        TP_HO_CHI_MINH("TP Hồ Chí Minh"),
        TRA_VINH("Trà Vinh"),
        TUYEN_QUANG("Tuyên Quang"),
        VINH_LONG("Vĩnh Long"),
        VINH_PHUC("Vĩnh Phúc"),
        YEN_BAI("Yên Bái");
        private final String displayName;

        CityEnum(String displayName) {
            this.displayName = displayName;
        }

        public String getDisplayName() {
            return displayName;
        }

        // Phương thức tìm enum dựa trên tên hiển thị từ cơ sở dữ liệu
        public static CityEnum fromDisplayName(String displayName) {
            for (CityEnum city : CityEnum.values()) {
                if (city.getDisplayName().equalsIgnoreCase(displayName)) {
                    return city;
                }
            }
            throw new IllegalArgumentException("Không tồn tại tỉnh thành với tên hiển thị: " + displayName);
        }

    }


    public Address() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        for (CityEnum city1 : CityEnum.values()) {

            if (city1.name().equalsIgnoreCase(city) || city1.getDisplayName().equalsIgnoreCase(city)) {
                this.city = city1.getDisplayName();
                return;
            }
        }
        throw new IllegalArgumentException("Không tìm thấy thành phố với mã: " + city);

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Address address = (Address) o;
        return street.equalsIgnoreCase(address.street) && district.equalsIgnoreCase(address.district) && Objects.equals(city, address.city);
    }

    @Override
    public int hashCode() {
        return Objects.hash(street, district, city);
    }
}
