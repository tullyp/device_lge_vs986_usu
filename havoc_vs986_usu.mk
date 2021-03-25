#
# Copyright 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit ROM vendor common stuff
$(call inherit-product, vendor/havoc/config/common_full_phone.mk)

# Inherit ROM vendor telephony stuff
$(call inherit-product, vendor/havoc/config/telephony.mk)

# Overlays (inherit after vendor to ensure we override it)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit from vs986_usu device
$(call inherit-product, device/lge/vs986_usu/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := havoc_vs986_usu
PRODUCT_DEVICE := vs986_usu
PRODUCT_BRAND := lge
PRODUCT_MODEL := LGVS986
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="g4" \
    PRODUCT_NAME="p1_global_com" \
    PRIVATE_BUILD_DESC="p1_vzw-user 6.0 MRA58K 1714511498b1b release-keys"

BUILD_FINGERPRINT := "lge/p1_vzw/p1:6.0/MRA58K/1714511498b1b:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.do_not_init_csvt=1 \
    rild.libargs=-d /dev/smd0 \
    ril.subscription.types=NV,RUIM \
    ro.telephony.call_ring.multiple=0 \
    ro.telephony.default_network=10\
    telephony.lteOnCdmaDevice=1 \
