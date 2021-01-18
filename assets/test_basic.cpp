/*
** EPITECH PROJECT, 2021
** <% repository %>
** File description:
** test_basic
*/

#include "my_criterion.hpp"

Test(basic, assert_true)
{
    cr_assert(true);
}

Test(redirect, baasic_redirection)
{
    OSRedirector oss(std::cout);

    std::cout << "Rick Rolled" << std::endl;
    cr_assert_eq(oss.getContent(), "Rick Rolled\n");
}