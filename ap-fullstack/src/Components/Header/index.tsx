'use client'
import { Link } from "react-router-dom";
import {
  Box,
  Flex,
  Avatar,
  HStack,
  useColorModeValue,

  Stack,
  Button,
  type BoxProps,
  type SystemStyleObject,
} from '@chakra-ui/react'
import type { IconType } from "react-icons";
interface LinkItemProps {
  name: string;
  path: string;
  icon: IconType;
}

interface SidebarProps extends BoxProps {
  onClose: () => void;

}
type Props = {
  children?: React.ReactNode
  linkItems?: LinkItemProps[]; // Recibe LinkItems como prop
  linkSession?: LinkItemProps[];
  _hover?: SystemStyleObject | undefined
}


const Links = ['Home', 'New Appointment', 'Appointment List', 'Priority List']

const NavLink = (props: Props) => {
  const { children, _hover } = props

  return (
    <Box

      px={2}
      py={1}
      p={3}
      rounded={'md'}
      _hover={_hover}

    >
      {children}
    </Box>
  )
}

export default function index({ linkSession, linkItems, children }: Props) {
  //console.log("linkItems", linkItems)
  const colors = useColorModeValue('gray.200', 'gray.700')
  return (
    <>
      <Box  bg={"#4B4B8C"} color={"gray.50"}  borderRadius={10}px={5} >
        <Flex h={"100%"} alignItems={'center'} justifyContent={'space-between'}>

          <HStack spacing={8} alignItems={'center'}>
            <HStack as={'nav'} spacing={4} display={{ base: 'flex', md: 'flex' }}>
              {linkItems?.map((link: LinkItemProps, index: number) => (
                <Link to={link.path} key={`${link.name}-${index}`} >

                  <NavLink key={link.name} _hover={{
                    textDecoration: 'none',
                    bg: "blue.600",
                  }} >{link.name}

                  </NavLink>
                </Link>

              ))}
            </HStack>

          </HStack>
          <Stack
            flex={{ base: 1, md: 0 }}
            justify={'flex-end'}
            direction={'row'}
            spacing={6}
            >



            {linkSession?.map((link: LinkItemProps, index: number) => (


              <NavLink key={link.name}  >
                {link.path ?
                  <Button
                    as={Link}
                    variant={'link'}
                    to={link.path}
                    key={`${link.name}-${index}`}
                    //display={{ base: 'none', md: 'inline-flex' }}
                    fontWeight={600}
                    width={70}
                    p={2}
                    color={'white'}
                    bg={'pink.400'}
                    _hover={{
                      bg: 'pink.300'
                    }}>

                    {link.name}
                  </Button> : 
                  <Box
                    display="inline-block"
                    width={300}
                    borderRadius="md"
                  >Welcome {link.name}</Box>}


              </NavLink>

            ))}
          </Stack>

        </Flex >



      </Box >


    </>
  )
}