# Increment PR number
PRINC = "5"

SRC_URI += "\
	file://inetd file://inetd.conf \
	file://mdev file://mdev.conf file://mdev-mount.sh \
	"

do_install_append() {
	if grep -q "CONFIG_CRONTAB=y" ${WORKDIR}/defconfig; then
		install -d ${D}${sysconfdir}/cron/crontabs
	fi
	install -d ${D}${sysconfdir}/mdev
	install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
	install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev
}

# use our own defconfig
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
