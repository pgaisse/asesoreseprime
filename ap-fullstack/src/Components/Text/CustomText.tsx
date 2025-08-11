import { type TextProps, Text } from '@chakra-ui/react'

type Props = TextProps&{
    children:string
}
const fixEncoding = (text: string) => {
  return text.replace(/\?/g, "ñ"); // Puedes ampliar esto si hay más errores de codificación
};

function CustomText({children, ...rest}: Props) {
  return (
    <Text {...rest}> {fixEncoding(children)} </Text>
  )
}

export default CustomText