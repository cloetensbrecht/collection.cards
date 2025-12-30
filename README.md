## License

The source code of this project is licensed under the MIT License.

Card images, artwork, logos, and trademarks belong to their respective owners
and are not covered by the MIT License.

## Credits & Attribution

This project uses third-party visual assets for display and tracking purposes only. All rights remain with their respective owners.

### Card Artwork & Icons

- **Pokédex SVG Icons**  
  Source: repositorio.sbrauble.com  
  URL: https://repositorio.sbrauble.com/arquivos/up/pokedex/*.svg  
  License: © The Pokémon Company (Pokémon), Nintendo, Game Freak, Creatures, and/or Wizards of the Coast

- **Dream World SVG Artwork**  
  Curated by: collectingdreamworld  
  Source: Community archive (Google Drive)  
  URL: https://drive.google.com/drive/folders/1DD84zq6yiQI90CtPU60F-mlI-qiFJI3U  
  License: © The Pokémon Company (Pokémon), Nintendo, Game Freak, Creatures, and/or Wizards of the Coast

- **Veekun – Dream World Art**  
  Source: Veekun Pokédex Project  
  URL: https://veekun.com/dex/downloads  
  License: © The Pokémon Company (Pokémon), Nintendo, Game Freak, Creatures, and/or Wizards of the Coast

- **Pokémon energy symbols**  
  Designed by: [Korapol](https://www.etsy.com/shop/Korapol)  
  URL: https://www.etsy.com/listing/1786031822/basic-energy-inspired-pokemon-cards
  If you want to use this icon set in any of your own projects, you should buy them.

## Icons

All icons are stored in the `/icons` directory and are saved as a **`.tsx`** file.  
Each icon is defined as a Typed React component using the following structure:

```tsx
import {SVGProps} from 'react'

export function Icon(props: SVGProps<SVGSVGElement>) {
  return (
    <svg {...props}>
      <path fill="currentColor" d="..." />
    </svg>
  )
}
```

### Alinea

Within Alinea, icons are sourced exclusively from the **Google Material Icons** collection on [**icones.js.org**](https://icones.js.org/collection/ic?variant=Outline). We only use the **Outline** variant of these icons to ensure a consistent and cohesive visual style throughout the project.
