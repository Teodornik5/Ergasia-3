CC = gcc                   # Ο compiler που θα χρησιμοποιηθεί (gcc)

OBJ = server.o client.o functions.o    # Τα αρχεία αντικειμένου (.o) που χρειάζονται για τη σύνδεση.
EXEC = eshop               # Το όνομα του εκτελέσιμου προγράμματος.

all: $(EXEC)               # Ο κύριος στόχος του Makefile. Κατά την εκτέλεση της εντολής `make`,
                           # το Makefile εκτελεί τον στόχο `all`, που δημιουργεί το εκτελέσιμο.

$(EXEC): $(OBJ)            # Το εκτελέσιμο πρόγραμμα `eshop` εξαρτάται από τα αρχεία αντικειμένου.
	$(CC) -o $(EXEC) $(OBJ)  
                                       # Χρησιμοποιεί τον `gcc` για να συνδέσει τα αρχεία .o και να παράξει το εκτελέσιμο `eshop`.

server.o: server.c functions.h client.c # Το `server.o` εξαρτάται από τα αρχεία `server.c` και `functions.h`.
	$(CC) -c server.c  	# Μεταγλωττίζει το `server.c` σε `server.o`.

functions.o: functions.c functions.h # Το `functions.o` εξαρτάται από τα `functions.c` και `functions.h`.
	$(CC) -c functions.c	  # Μεταγλωττίζει το `functions.c` σε `functions.o`.

client.o: server.c functions.h functions.clean
	$(CC) -c client.c
	
clean:                     
	rm $(OBJ) $(EXEC)    # Διαγραφή όλων των παραγόμενων αρχείων (.o, το εκτελέσιμο).
