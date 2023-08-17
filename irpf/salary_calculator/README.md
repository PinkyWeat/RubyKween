# Salary Calculator

#### Why in English? dunno

---

## Description

I'm creating this both for learning ruby && further understanding of how to calculate my salary after taxes.

So basically we have `BPS` & `IRPF`

## BPS
- `FRL`: This is the 'Fondo de Reconversión Laboral', used for giving an opportunity to improve workers skills, specially for those who don't have a job atm. This is given through the "Instituto Nacional de EMpleo y Formación Laboral" or better known as INEFOP.
    
  Fixed rate of 0.125% of worker's nominal salary.


- `FONASA`: in summary, is the medical coverage for the worker and their family.
  
  | Discount | Description                                                      |
  |----------|------------------------------------------------------------------|
  | 3%       | Salary does not exceed 2.5 BPS ($14,150)                         |
  | 4.5%     | Without children, spouse, or partner; salary > 2.5 BPC ($14,150) |
  | 6%       | With children, spouse, or partner; salary > 2.5 BPC              |
  | 6.5%     | Without children, but with spouse or partner; salary > 2.5 BPC   |
  | 8%       | With children and spouse or partner; salary > 2.5 BPC            |


- `Aportes Jubilatorios`: this accounts for retirement contribution that the worker must pay with their salary.
    
   Fixed rate of 15% of worker's nominal salary.


## IRPF

This accounts for "Impuesto a las Rentas de las Personas Físicas" for all income of individuals residing in the country. It's by far the most complicated to understand, and I'm tring my best rn tbh.

So it's calculated by range, and not the whole amount. Take a look at the table below:

| BPC Ranges        | From    | To      | Tax |
|-------------------|---------|---------|-----|
| up to 7 BPC       | 0       | 39.620  | 0%  |
| 7 to 10 BPC       | 39.620  | 56.600  | 10% |
| 10 to 15 BPC      | 56.601  | 84.900  | 15% |
| 15 to 30 BPC      | 84.901  | 169.800 | 24% |
| 30 to 50 BPC      | 169.801 | 283.000 | 25% |
| 50 to 75 BPC      | 283.001 | 424.500 | 27% |
| 75 to 115 BPC     | 424.501 | 650.900 | 31% |
| more than 115 BPC | 650.901 |         | 36% |

Here's an example? Kinda hehe.

### Let's say we have a nominal salary of $65.000 Uruguayan Pesos:

> - Up to $39.620 Uruguayan Pesos there's a 0% rate.
> 
> 
> - On the portion of salary that falls between 7 and 10 BPC, we have a rate of 10%
>   - $56.601 - $39.621 = $16.980 => -10% = $1698
> 
> - On the portion of the salary that falls between 10 and 15 BPC, we have a rate of 15%
>   - $60.000 - $56.601 = $3399 => -15% ~= $510
> 
> In total would be -$2208

_I almost lost all my sanity here_

Source: [BPS Official Website](https://www.bps.gub.uy/bps/file/20427/2/2023---comunicado-9---valores-escalas-irpf-2023.pdf)

-----

## Author

Written by [Denisse Landau](https://www.linkedin.com/in/denisselandau/)
