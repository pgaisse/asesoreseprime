"use client";
import { Link } from "react-router-dom";
import { useColorModeValue } from "@chakra-ui/react";
import {
  IconButton,
  Box,
  CloseButton,
  Flex,
  Icon,
  Text,
  Drawer,
  DrawerContent,
  useDisclosure,
  

  Skeleton,
  Stack,
  type FlexProps,
  type BoxProps,
} from "@chakra-ui/react";
import {
  FiMenu,
} from "react-icons/fi";
import type { ReactNode } from "react";
import type { IconType } from "react-icons";
//

interface LinkItemProps {
  name: string;
  path: string;
  icon: IconType;
  color:string;
}


interface SidebarProps extends BoxProps {
  onClose: () => void;
  linkItems: LinkItemProps[]; // Recibe LinkItems como prop
}

const SidebarContent = ({ onClose, linkItems, ...rest }: SidebarProps) => {

  return (
    <Box
    shadow={"sm"}
      {...rest}
      bg={useColorModeValue("purple.800", "purple.800")}
      h="100%"
      position={"fixed"}
      {...rest}
    >

      {linkItems.map((link, index) => (
        <Link to={link.path} key={`${link.name}-${index}`}>
          <NavItem key={link.name} icon={link.icon} iconColor={link.color} color={"white"}>
            {link.name}
          </NavItem>
        </Link>
      ))}
    </Box>
  );
};

interface NavItemProps extends FlexProps {
  icon: IconType;
  iconColor:string;
  children: ReactNode;
}
const NavItem = ({ iconColor,icon, children, ...rest }: NavItemProps) => {
  return (
    <Box style={{ textDecoration: "none" }} _focus={{ boxShadow: "none" }}>
      <Flex
        align="center"
        py={6}
        mx="4"
        borderRadius="lg"
        role="group"
        cursor="pointer"
        _hover={{
          bg: "purple.700",
          color: "white",
        }}
        {...rest}
      >
        {icon && (
          <Icon
            color={iconColor}
            mr="4"
            _groupHover={{
              color: "white",
            }}
            as={icon}
          />
        )}
        {children}
      </Flex>
    </Box>
  );
};

interface MobileProps extends FlexProps {
  onOpen: () => void;
}
const MobileNav = ({ onOpen, ...rest }: MobileProps) => {
  return (
    <Flex
      ml={{ base: 0, md: 60 }}
      px={{ base: 4, md: 24 }}
      height="20"
      alignItems="center"
      bg={useColorModeValue("white", "gray.900")}
      borderBottomWidth="1px"
      borderBottomColor={useColorModeValue("gray.200", "gray.700")}
      justifyContent="flex-start"
      {...rest}
    >
      <IconButton
        variant="outline"
        onClick={onOpen}
        aria-label="open menu"
        icon={<FiMenu />}
      />

      <Text fontSize="2xl" ml="8" fontFamily="monospace" fontWeight="bold">
        

      </Text>
    </Flex>
  );
};

interface SimpleSidebarProps {
  linkItems: LinkItemProps[]; // Recibe LinkItems como prop
}

export default function SimpleSidebar({ linkItems }: SimpleSidebarProps) {
  const { isOpen, onOpen, onClose } = useDisclosure();
  return (
    <Box minH="100vh"  >
      <SidebarContent
      py={10}
      w={"180px"}
        onClose={() => onClose}
        display={{ base: "none", md: "block" }}
        linkItems={linkItems} // Pasa LinkItems al SidebarContent
        borderRadius={20}
        mt={5}
      />
      <Drawer
        isOpen={isOpen}
        placement="left"
        onClose={onClose}
        returnFocusOnClose={false}
        onOverlayClick={onClose}
        size="full"
      >
        <DrawerContent>
          <SidebarContent onClose={onClose} linkItems={linkItems} /> {/* Pasa LinkItems al SidebarContent del Drawer */}
        </DrawerContent>
      </Drawer>
      {/* mobilenav */}
      <MobileNav display={{ base: "flex", md: "none" }} onOpen={onOpen} />
      <Box ml={{ base: 0, md: 60 }} p="4">
        {/* Content */}
      </Box>
    </Box>
  );
}