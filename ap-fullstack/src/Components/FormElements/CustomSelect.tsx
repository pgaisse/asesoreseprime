import { Select, type SelectProps } from '@chakra-ui/react'
import { type ReactNode } from 'react'

type Props = SelectProps & {
    children: ReactNode
}

function CustomSelect({ ...rest }: Props) {
    return (
        <Select size="sm"
            width="auto"
            minW="200px" {...rest}>

        </Select>
    )
}

export default CustomSelect