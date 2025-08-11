import SideBar from "@/Components/SideBar";
import { useAuth0 } from "@auth0/auth0-react";
import { IoSettingsOutline } from "react-icons/io5";
import {
  Grid,
  GridItem,
  Box,
} from "@chakra-ui/react";
import { useEffect, useState, type ReactNode } from "react";
import { Outlet } from "react-router-dom";
import {
  FiHome,
  FiUser,
  FiCalendar,
} from "react-icons/fi";
import { TbHomeExclamation } from "react-icons/tb";
import { HiUserGroup } from "react-icons/hi2";
import { FaUserCircle } from 'react-icons/fa';
import { MdOutlineSupportAgent } from "react-icons/md";
import Header from "@/Components/Header";
import router from "./App";
import paths from "@/paths/paths";

interface LinkItem {
  name: string;
  path: string;
  icon: any;
  color: string;
}

type Props = { children?: ReactNode };

const Layout = ({ children }: Props) => {
  const { user, isAuthenticated, isLoading } = useAuth0();
  const [linkItems, setLinkItems] = useState<LinkItem[]>([]);
  const [linkSession, setLinkSession] = useState<LinkItem[]>([]);

  useEffect(() => {
    if (!isLoading && !isAuthenticated) {
      setLinkItems([
        { name: "Home", icon: FiHome, path: "/", color: "blue.500" },
        // { name: "Profile", icon: FiUser, path: "/profile", color: "cyan.600" },
      ]);
      setLinkSession([
        { name: "Sign in", icon: FaUserCircle, path: "/Signin", color: "pink.300" },
      ])
    } else if (!isLoading && isAuthenticated) {
      setLinkItems([
        { name: "Home", icon: FiHome, path: "/", color: "blue.500" },
        { name: "Casos", icon: TbHomeExclamation, path: paths.cases, color: "green.500" },
        { name: "Mis Casos", icon: HiUserGroup, path: paths.myCases, color: "green.500" },
        { name: "Asesores", icon: MdOutlineSupportAgent, path: paths.advisers, color: "green.500" },
        { name: "Clientes", icon: HiUserGroup, path: paths.clients, color: "green.500" },
         

      ]);
      setLinkSession([
        { name: `${user?.name}`, icon: FaUserCircle, path: "", color: "pink.300" },
        { name: "Log out", icon: FaUserCircle, path: "/Logout", color: "pink.300" },
      ])
    }
  }, [isAuthenticated, isLoading]);

  return (
    <Grid
      templateAreas={`"header header"
                      "nav main"`}
      gridTemplateRows={"70px 1fr"}
      gridTemplateColumns={{ base: "0 1fr", md: "200px 1fr" }}
      transition="all 0.3s ease"
      gap="1"
      color="blackAlpha.700"
      fontWeight="bold"
      bg={"gray.200"}
    >
      <GridItem pl="2" area="header"
        position="fixed"
        top="0"
        left="0"
        width="100%"
        zIndex="999">
        <Header linkItems={linkItems} linkSession={linkSession} />
      </GridItem>

      <GridItem
        pl="2"
        area={"nav"}
        height={"100%"}
        overflow="hidden"
        transition="all 0.3s ease"
        display={{ base: "none", md: "block" }}
        bg={"white"}
      >
        <SideBar linkItems={linkItems} />
      </GridItem>

      <GridItem pl="2" area={"main"} bg={"white"}>
        <Outlet />
      </GridItem>


    </Grid>
  );
};

export default Layout;
