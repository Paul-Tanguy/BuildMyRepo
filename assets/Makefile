##
## EPITECH PROJECT, 2021
## <% repository %>
## File description:
## Makefile
##

	# variables #
# directories #
SRCDIR		=	sources
INCDIR		=	includes
LIBDIR		=	lib
TSTDIR		=	tests
# !directories #

# constants #
CC			=	g++
MAKE		=	make
RM			=	rm -rf
CPPFLAGS	=	-W -Wall -Wextra -Wshadow -I$(INCDIR)
# !constants #

# binary #
BINARY		=	<% binary %>
# !binary #

# sources #
MAIN		=	sources/main.cpp
RAWSRC		=	<% binary %>.cpp		\

# !sources #

# smart variables #
MAINO		=	$(MAIN:%.cpp=%.o)
SOURCES		=	$(RAWSRC:%=$(SRCDIR)/%)
OBJECTS		=	$(SOURCES:%.cpp=%.o)
# !smart variables #
	# !variables #

	# rules #
# compilation #
all:		$(BINARY)

$(BINARY):	$(OBJECTS) $(MAINO)
			$(CC) -o $(BINARY) $(MAINO) $(OBJECTS) $(CFLAGS)
# !compilation #

# unit tests #
tests_run:	CPPFLAGS += --coverage
tests_run:	$(OBJECTS)
			$(MAKE) -C $(TSTDIR) re
# !unit tests #

# cleaning #
clean:
			$(RM) $(OBJECTS) $(MAINO)

tclean:
			$(MAKE) -C $(TSTDIR) fclean

fclean:		clean tclean
			$(RM) $(BINARY)
# !cleaning #

# full build #
re:			fclean all
# !full build #

# phony #
.PHONY:		all tests_run tclean clean fclean re
# !phony #
	# !rules #