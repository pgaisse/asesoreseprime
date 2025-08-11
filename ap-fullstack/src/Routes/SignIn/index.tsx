import React, { useEffect, useState } from 'react';
import { useAuth0 } from "@auth0/auth0-react";
import { useNavigate } from 'react-router-dom';
import {
  Modal,
  ModalOverlay,
  ModalContent,
  ModalHeader,
  ModalBody,
  Spinner,
  Text,
  useDisclosure,
} from '@chakra-ui/react';
import axios from 'axios';

type Props = {}

const Index = (props: Props) => {
  const { error, logout, loginWithRedirect, isAuthenticated, isLoading, user } = useAuth0();
  const [hasLoggedOut, setHasLoggedOut] = useState(false);
  const [hasTriedLogin, setHasTriedLogin] = useState(false);
  const navigate = useNavigate();
  const { isOpen, onOpen } = useDisclosure();

  // Logout first and redirect to /error if needed
  useEffect(() => {
    if (!hasLoggedOut) {
      logout({ returnTo: window.location.origin + "/error" } as any);
      setHasLoggedOut(true);
    }
  }, [logout, hasLoggedOut]);

  // Clear storage after logout
  useEffect(() => {
    if (hasLoggedOut) {
      localStorage.clear();
      sessionStorage.clear();
    }
  }, [hasLoggedOut]);

  // Login after logout completes
  useEffect(() => {
    if (hasLoggedOut && !isLoading && !isAuthenticated && !hasTriedLogin) {
      onOpen(); // show modal
      loginWithRedirect({
        organization: "org_BzRwcS0qiW57b8SX",
        prompt: "login"
      } as any);
      setHasTriedLogin(true);
    }
  }, [hasLoggedOut, isLoading, isAuthenticated, loginWithRedirect, hasTriedLogin, onOpen]);

  // 👉 Insert user into MongoDB after Auth0 login
  
  
  // Redirect if there is an error
  useEffect(() => {
    if (error) {
      navigate('/');
    }
  }, [error, navigate]);

  return (
    isOpen ? (
      <Modal isOpen={isOpen} onClose={() => { }} isCentered closeOnOverlayClick={false}>
        <ModalOverlay />
        <ModalContent>
          <ModalHeader>Signing in</ModalHeader>
          <ModalBody textAlign="center" pb={6}>
            <Spinner size="xl" mb={4} />
            <Text>Please wait while we sign you in...</Text>
          </ModalBody>
        </ModalContent>
      </Modal>
    ) : null
  );
}

export default Index;
