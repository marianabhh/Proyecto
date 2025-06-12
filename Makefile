# Compilador y opciones
CC = gcc
CFLAGS = -Wall -Wextra -O2

# Nombre del ejecutable
TARGET = test_device

# Archivos fuente
SRC = test_device.c

# Regla por defecto
all: $(TARGET)

# Cómo compilar el ejecutable
$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

# Ejecutar el programa como usuario normal
run: $(TARGET)
	./$(TARGET)

# Ejecutar el script de prueba como root (requiere sudo)
test: $(TARGET)
	chmod +x test_device.sh
	sudo ./test_device.sh || echo "Error: Verifique que el módulo del kernel esté cargado y configurado correctamente."

# Limpiar binarios
clean:
	rm -f $(TARGET)
