package com.hust.shopcardbackend.services;

import com.hust.shopcardbackend.config.exceptions.EmailNotFoundException;
import com.hust.shopcardbackend.dto.user.UserRegistration;
import com.hust.shopcardbackend.dto.user.UserResponse;
import com.hust.shopcardbackend.dto.user.UserUpdateRequest;
import com.hust.shopcardbackend.entities.User;
import com.hust.shopcardbackend.repositories.IUserRepository;
import com.hust.shopcardbackend.utilities.RoleUser;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;

@Service
@RequiredArgsConstructor
public class UserService implements IUserService, UserDetailsService {

    private final IUserRepository repository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

        boolean userExists = repository.findByEmail(email).isPresent();
        if (!userExists) {
            throw new UsernameNotFoundException("User is not exists!");
        }

        User user = repository.findByEmail(email).get();

        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(user.getRole().toString()));


        return new org.springframework.security.core.userdetails.User(
                user.getEmail(),
                user.getPassword(),
                authorities);
    }

    @Override
    public UserResponse addUser(UserRegistration userRegis) throws Exception {

        boolean userExists = repository.findByEmail(userRegis.getEmail()).isPresent();

        if (userExists) {
            throw new Exception("Email is exists!");
        }
        repository.save(new User(userRegis.getFullName(), userRegis.getEmail(), userRegis.getPhone(), userRegis.getAddress(), userRegis.getAvatarLink(), userRegis.getPassword(), RoleUser.valueOf(userRegis.getRole()), null, null));

        return login(userRegis.getEmail(), userRegis.getPassword());
    }

    @Override
    public UserResponse updateUser(UserUpdateRequest user) throws NullPointerException {

        boolean userExists = repository.findByEmail(user.getEmail()).isPresent();

        User userUpdate;

        if (!userExists) {
            throw new NullPointerException("User is not exists!");
        } else {
            userUpdate = repository.findByEmail(user.getEmail()).get();

            userUpdate.setFullName(user.getFullName());
            userUpdate.setPhone(user.getPhone());
            userUpdate.setAddress(user.getAddress());
            userUpdate.setAvatarLink(user.getAvatarLink());
        }


        repository.saveAndFlush(userUpdate);

        return new UserResponse(
                userUpdate.getId(),
                userUpdate.getFullName(),
                userUpdate.getEmail(),
                userUpdate.getPhone(),
                userUpdate.getAddress(),
                userUpdate.getAvatarLink()
        );
    }

    @Override
    public UserResponse login(String email, String password) throws EmailNotFoundException {

        boolean userExists = repository.findByEmailAndPassword(email, password).isPresent();

        if (!userExists) {
            throw new EmailNotFoundException("Email is not found!");
        }

        User user = repository.findByEmailAndPassword(email, password).get();

        return new UserResponse(
                user.getId(),
                user.getFullName(),
                user.getEmail(),
                user.getPhone(),
                user.getAddress(),
                user.getAvatarLink());
    }

    @Override
    public void deleteUser(String email, String password) throws EmailNotFoundException {
        boolean userExists = repository.findByEmail(email).isPresent();

        if (!userExists) {
            throw new EmailNotFoundException("Email is not exists!");
        }

        repository.deleteUserByEmailAndPassword(email, password);
    }
}
