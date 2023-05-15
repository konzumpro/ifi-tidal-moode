PREFIX = /opt

configure:
	chmod +x ./bin/tidal_connect_application
	chmod +x ./bin/speaker_controller_application
	chmod +x ./select-device.sh
	chmod +x ./start.sh
	./select-device.sh

.PHONY: install
install: bin/tidal_connect_application bin/speaker_controller_application
	install -d $(DESTDIR)$(PREFIX)/tidal-connect/
	cp -r ./* $(DESTDIR)$(PREFIX)/tidal-connect
	chmod +x $(DESTDIR)$(PREFIX)/tidal-connect/bin/tidal_connect_application
	chmod +x $(DESTDIR)$(PREFIX)/tidal-connect/bin/speaker_controller_application
	chmod +x $(DESTDIR)$(PREFIX)/tidal-connect/start.sh
	cp tidal-connect.service /lib/systemd/system/
	cp speaker-controller.service /lib/systemd/system/
	systemctl enable tidal-connect.service
	systemctl start tidal-connect.service
	systemctl enable speaker-controller.service
	systemctl start speaker-controller.service

.PHONY: uninstall
uninstall:
	systemctl stop tidal-connect.service
	systemctl stop speaker-controller.service
	systemctl disable tidal-connect.service
	systemctl disable speaker-controller.service
	rm -rf $(DESTDIR)$(PREFIX)/tidal-connect
	rm /lib/systemd/system/tidal-connect.service
	rm /lib/systemd/system/speaker-controller.service
