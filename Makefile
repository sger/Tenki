secrets:
		mkdir -p Tenki/Configs \
		&& cp -n Configs/Secrets.swift.example Tenki/Configs/Secrets.swift \
		|| true; \

.PHONY: secrets