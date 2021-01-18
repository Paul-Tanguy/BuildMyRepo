/*
** EPITECH PROJECT, 2021
** <% repository %>
** File description:
** my_criterion
*/

#ifndef MY_CRITERION_HPP_
    #define MY_CRITERION_HPP_

    #include <criterion/criterion.h>
    #include <iostream>
    #include "<% binary %>.hpp"

    class OSRedirector {
        public:
            OSRedirector(std::ostream &c) : _c(c) {
                _backup = _c.rdbuf();
                _c.rdbuf(_oss.rdbuf());
            }
            ~OSRedirector() {
                _c.rdbuf(_backup);
            }
            const std::string getContent() {
                _oss << std::flush;
                return _oss.str();
            }

        private:
            std::ostringstream _oss;
            std::streambuf *_backup;
            std::ostream &_c;
    };

#endif /* !MY_CRITERION_HPP_ */
