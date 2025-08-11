import { CardHeader, type CardHeaderProps } from '@chakra-ui/react'
import React, { type ReactNode } from 'react'

type Props = CardHeaderProps&{
    children: ReactNode
}

function CustomCardHeader({children,...rest}: Props) {
  return (
    <>
    <CardHeader {...rest} my={-5}>
        {children}
    </CardHeader>
    
    </>
  )
}

export default CustomCardHeader