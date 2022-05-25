import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookGridItem extends StatelessWidget {
  // final Book book;
  // final void Function() onTap;
  const BookGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Stack(
        children: <Widget>[
          Hero(
            tag: "nome-livro_image",
            child: Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: CachedNetworkImageProvider("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGCBUVExcVFRUYGBcZGhsaGhoaGhwaHxwaHCEaGhkbHR0bHysjHB0pIBkZJDUlKCwuMjIyGSE3PDcxOysxMi4BCwsLDw4OEA4QEC4bFxsuMS4uOzEuLi4uLi47MTE7Li4uLi47Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLv/AABEIARQAtgMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAFAAIDBAYBBwj/xABJEAACAQIEAwUEBgYGCQUBAAABAhEAAwQSITEFQVEGEyJhcQcygZEjQlKhsfAUYoLB0eEVM3JzsvEWJENTg5KT0tMlNGN0ohf/xAAWAQEBAQAAAAAAAAAAAAAAAAAAAQL/xAAWEQEBAQAAAAAAAAAAAAAAAAAAEQH/2gAMAwEAAhEDEQA/ANRhbilhrzFFsIfAuvIUNt2VzLtuKI4a14FgnYVGk4c10seYqHK3WuS1BPmHSugDrUAvHnS70eVBZgdaayDrUJcV0GgfkHWllHX7qZPnXCB+Z/jQcxQEda5bB5Uxk6E+n8zTwpPQUDySN2A9SKeCOvyFNSz5/KulVG5+ZoFK9TXc3RT8aQcfVX8/GunMeg++g54jzA9KRUcyTXSvVv3UhA2FB1WH1VruvkKWY+lKfjQcCDrNQYxug+qfxFTg1Wxw6/ZO/qKCoXpU0v019KVBSsFwy7HUcqL4K6ciyOQ2rN4LHNnUTzFH8DiptoSPqigt98OvzFODz0+dRd4tdCqdiKolkedIqDzFRi0eRNI5vX1FEONgdBTe59fnQ3iKXi821IhIUi4FUuWBYssy0KuUAiDnO24ge/jYOkSG0ItmDFzLs0R/VnfmRyJIGChHM/EU0q3UfKhRu4rMCFXZVgFAEBbxLBbxQFU5jrEgRMiziVvy7IhL5zkPeLk7sqAoCE6mdywkSxE6CoVYuZvI+lS2kJ3I/GhV1sYJOQ6kCB3UBczEkCd8pXQk+6QJLSO4/vmKd2pQAEklx9cARlDCSstuYmCCaFGgg5sT8f4U9YGw/PxoEv6Z4It6AiZNvbxgkeLcAqwBJ1UqZ942bdzFFbgKeLa2fo4EBvFo2swoE8ySYGlCipY+lNJ86C2rOMtqijxqoRfEULlQuVmZi3ieYYSdSYOkmnsMX4SShPi0AWEIyKNSZYtN1ugAUQDrQotFdiqvDTdFv6bLnk6iACBsQATAOpE6wRNTFxzJNBLoK4WpizyFdynmaK7n8/lVTHHoJ8J/FatSB51U4gzHYR4T+K0FPIeZilTFQc2JPlXaAPh8KQ66cxRjBIRbSD9Ub15xwrtniFuIty0GGYAkVtOBdqLNyzbLgpmQH51UGTPMfKuZxz09adYxVq57lxT8asG18aih3E7lzIvczmzqdGCjKviKsTyeMmk+/VfD4vGg5cvvMxLuoZVBeFAhwQoTYAH3TzIom1nypotxrJoija4hi5I7pd2OYgQfGoGnekqTbLeESJTlNTYTiGIysXtQwW3lUAe9mYXSPHDDKFYDT3oJ0mrADeRruYjlQVcK94WSCkuFypmgnwqZuXGLasxAhRoCwkxMQXLWLCNbCFgUAFxYzyVIJJ7zV8wJmAIdecirPE7lzuX7sxcIhCADB6mdIHnVJsVigS3d3CM2ZUXTKFCkW5HvBmRpJBP0gyxtVFu5cxi6C3mG+ig5VJYBSTckuq5CeROYaaGm8GxF5Ui7bMhJUaFiw1YM5aJYt4QNgp15BtziWLWQbaNPukI8bSJBedwRyiQfIw3sVfF52S2zoGUBMoIOiSy7EznYb6G3MQdQdY/TBlzI9zJ4feENrcYXWIYGfBaEa6PEGSRY7zGI1yFDBiHXMB4YUoUVQ5AzC3baJgG42pOlcXF4xpi0FCiSGRxMLckLD6ksLcdA53I1bhuIYhgCtpWVwClzI4TKwDK5AYkiGgidCvTYiTAPfRLga27BUfIHablx9rfizEKICz5ljppLM+LTNr4QoVXcFhcKosZUDSGd2dSTHuLpFHc4B8IpEt1iigzXMYra20KzsoEqDI3NzXLo3622k6c/SsZlJFtM2UEDKJnKCyn6T3swdRrHiQ9YM5R5n1pZ/wAgUCRnIEwDAn150iBzM01m6wPXWob+KRBJOnnpRVjN0qlxJ43geA7+q1Tbjan3QfgIrPdpuJXG0Byg2ztv76fxomimK4jbWMzffFKsH3I5kk9SZrtIingbY7xI+0N60fDMODYtafUH4UMw2Bi6gj649a0nDLGWzb/sAVdXFA4PXSQamt4nEW9FuN6GrptHfpTSh/zqKkw/aa6ulxAw60Qsdp7LaMCtCDhxzFRNhVO60GtsY2zcHhcfGrK2uh++sC+AjYx6Urb3UjLcNBu2Q8x938Kbl+H3isphu0d9PfAYUXwXaW0+jjIfP+NQFhPrUdpwrERqdamtMjiUYHzFVb5IuA9RvG3rQX1ZjvoPOpIHmfM6CoUYDU/M7/Kor+PRdSR6sYFEXA3ST6aCo2cDcgempoVe40vLM/oMo+Zofd4jdbRYQT9USY9TVUexOLRBLEAdWMfdQ+7xsHRAz+ajKPmdaDGyCZaSepMmrCW/WBQPu4y6+khB+rqfmar91O7E+pmrCW+mvl+NS90CKCqkUM45qT/dN/jt0e7kbzNUOM27anUSe7PPlmSf3UTWWS2fI+ZpUUa0wUTA8iQCee3ltSqovYfG4XEOkBkusyrAiJ/dtRrh3DlFtFD7KIJGnz+BrGLhLlu6he0cgdYIOYjUAEnffX4VoeE3ybKMtwE5FAJkHnH5PSi4I38IQdh68vnUHc/q/PlVlcWQTm1UEZSPzB19IoP267SCzhWNkN39xhbtGNRm1Zo+1G3mwNQV+OcfwuGJS7cGcf7NBnYeRjRT5Eih2D7X4G4YzvbJMDvEAHzQsAPMxWn7J9j8Ph7Q9y5iiJu3HGYhzqwWdgNddzEnyn4pwW3dUpeso6kcxr5lWHiEdRzNCqK4WYIOYGCCsEEHYgzEH8KpXXti+MMW+lZc4UA6rqZmI5HShfZRnweNfhzuWtOpuWC3LdiPKQGB5SmgEmp8WZ47a/8ArHbnpc+VCibcPby/PSqF1bZxAw+13Lny5SfD1BiPh1rUgD8/u/AVk3P/AK6P/reemh2oLljht222ZGKHqDp+eVWEvX7hI7y2TbfI3vCGhWIIjUgMp+MVd4xj1w9i5ffVbayB9o7Is/2iB8TWP7Fm7hcTbGIaVx9vvAdst0EtlM/WysJ83UcqDWG3fYy1wQNdNNN6zP8ApXgZk3ix11Nu4fxFbcHQiORiesSR+81lfZVbnhyyoYd7c3UH7Omo/IoL2Cxti7Za7bcPbQE3CJlQoJaViQYGgihS9sMAP9s3/Sf+Fc7PrbHGMUljL3Js/SBR9HnlJAA8O5YRtq1EfaJhLS8OvlbVtWhIK21B99JggecUKgs9ruHkgC82YwB9G/PTTSB01rSG0BMmIBJJ2Eb/AAAqp2Y4ehwmFPc2iTZsnMUTU92p1kannNUvaHeuW7CYe3/XYt+5QRqE2uN6agT5+VAUwyrcVHRvA6hlPIq2qny061MtvUR1/wAp/GgPYDEiwt/A3mVrmGfwMTAeyxzBhO2406OByo1i+KjxBJHOSIKTpqPKJkdaCzbw+7OYAWZJ5cpqDjr27aFyoIy5ZnQrmUtlP2vI70Mu4o6E6mBrMwdvCdjE7VR4/bvXRlACobURsph0mV3J8/WgGY/jlzNFmBlLA6LzOzTIkQBp51ynYTgVpQQ7FtZEGI6jeY9aVEafDqc6+oohZwdp7aZkE5RqND8xUNm14l9RRLDp9GnoKjQZd4SQD3dz4N9+o8vKsd7ScHct2rF9lMW78vl1WDBU77+GOW4r0aKhx2FS7be1cXNbuAqy7SPXkRuDyIqoAG8r5WtsCCM4gwCGAiCNYhp+FRYPtV/rBwxNxLgEqLgXxjb6J1YyTroY2jcEUJHAeIYKbeHW3jMMScqvCOgbcA5lI5bEg7wKo8U4BxLGZEbC27AtnMLj3JZfIMGJjQaAbigJtixieP2WMMMNZYXTAgEC54ehIa4g9ZqfFrbftDZAIVWwxjpMXND8tqD9iimHa7g76d3is+Z2dp70CSmU9NZ31Gs9LnaLh73nt37FwW8RZP0bE6OsjRjuPFniREEg76EbzEcOcbEEa7fvnrWIuof6eg6FcNrPLTpy3Eeoq1hO0nFFA/8AT7bXGBIfvVyEiTJUNtHLNyon2O4DctXL2NxhF3F3tGCRFtYBCSYGYwgjkFGu5oM52+xL3b9nB2rTX8sX71pSFlV0RC2oCwZOn1hVftbi8bibMHh1y21pluJcW4GNspqfDlE6T93Sth2B4JctvisXjbapiL9zRZDBLQ91QVkbwI6W1rW23j6oA9N9pHnQZTs/jhisPbvos94hzDTRxIdeX1p+EV5Rw7s1nwCY5bZuC3dcXrWYrntLlOZSNViSCRPI8jXpnZDh93B3cZYKj9Ddmu2GDLKnSUyzm2KjaJt+dVPZyLmEwQtXVh+8chJVgVfIBqJEmDp0FAV7IYHBrhxcwgC23XPI1Ytr4bhJJzLqI6g9ao+0wAcNxGkGEEn6wDpqvUTI5HQUG4Rg7+DxFxsOp/Q7p8agqDZuEaEBz4gJgdV8wKIdqsHcxOFu27SFnfKBJhdGDSpaNI+dFGez3ECuDwirBIw1mDyB7tJzc4Guo61hcTxu7e4jcxNvDNet2QbNkLcyhG3d1JBkkliIGzCtDd4diUwCLbzNiEspaVJRcpKqryxOU5fERG5jWiHY7gwwuGt28i94BmuN1uNqfFzjRdOS0IxPFeI4lMRbx1zBvZt/1V1mbMHRzpngAyN5jUqK3a8OE5nfTcR0Oog8xrO3OrXGeFDE2LllzAuIQDvDbo3wYA/Cq3YnCYhMLbt4q3lu2vACWVsyD3CCpOw8Ov2fOguYbCqo8CR/OoeJ4WTr9g7f2lo2lqKhxaf4T+K1FZ6zhI2FKiypSqhtk+JfUUTw6+BfQUKw+6x1FFcKfAvoKI4yeVN7skwKsjevKfah2xd7xwGEJgMLdx01a45IHdIRqFB0MasZG24rT8d7aYPCsUe4bjjQpaAcg9C0hB85oEfanhp/qL0dZSflNS9lfZdaRQ+NJuXCNbSMVRPJmUhmb0IGvPetV/opgYj9Dsf8gn5nWgEcE7cYLEEILhtOdAt1Qk+QcErz5kUdxGDtt7yQdPEuh5kHT1J+NZTtN7M8NdUthZsXOSklrbHocxLJ6gwOlGPZ/hLtrA27d5WFy21xCG1IAc5QD9mIiNIiKC4mAZGzI2YdCBOg8PkROuoq3xTF21w9y458NtHdtIOUCCYb6xIgQeYqYivP/bRxgpZt4RD4rxDuBv3anwD9pwT+xQbHgnElxCI9ogIbauB+u+rI2+qxr51ZxLXNIggxlIJ31nQA6Qo/5jXn3sY4pKXcI+jWybqdQphbix5GD11NbvE3TrBOvx+XnUFS/YuGCxMy2YSNBrlPSYIn0rJ2O3OAE5jeM7juxG0E+/vtW4tYYsJIgQd9eXSvIvZJwWxi8Tdt4i33iraLAZnWGzIJlGB2JqjX4ft/gOZuLpEm3Og21BJrT8GxNrE289m6roDBKnxA9GBgqfUUMxfs04c4hbdy0ftJcZiPhcLA157wt7nCOLC2zSgdUuRoHs3IIaOuVg3kRFCvaBhh0puPupas3LrmFtIzt6ATHqdh5miL24JHSvOPbnxjJZt4ND47pFy4B/u1MIP2nk/8PzoVt+C4pL9m3fT3biK48p95T5gyD6VeCV5t7CuMEpdwTyGtk3LYOhykhbixyhoP7TV6UahhBRVXH76fZP4irYqpjW/w/vFFUwOtKm5jSoG4cgsPUUUww8C+goLhSpZcp50XwkhF9BtRFLtZxH9Gwd++PeS2cv8AbaET/wDTA/CvN/YZwkPdu4txJtQlsnX6R5Lt6hdJ/XrZe1YFuFYiNY7sn0F1JoP7B3H6HeXmL8n0KLH4Gqj0GaQrsVyKKTLTMlPFL4VBC6jc6Aak9ANST8K8j7OKeKcZfEMCbNo94AZjJb8NlfKSASP7VbP2u8Z/R8CyK0XMQe7XqLe91vSIT/iUG9lWNwOEwc3MVZS9ebO4LQVVZW2h9PE37dVATtojcO4vbxaA93dbvTHPN4b6epkn9sV6cGUwVMqwDKeoOoI+BrIe1DHYHF4JgmLstdtMLlsBtW5Og05qZ8yop3sm4oL+EFtzL4dgnrbaTbPwOZfRVouN7ZQR8D+BryP2BLOLvf3B/wAaV7BZYAH0P4V889huzL4+69q3dS2VQuS2aCJVY8I86I+h8Xet2lz3Llu2o3Z3VR8ya8M7S4gcT4yBY8SO9u2hiJRAAzmeWjt6RRm37H70+LFWgOoRyfkY/Gtx2K7F4fASyFrt4iDdYAQOYRR7oPMkk8poNTccEkkwupJ6AaknyivG+zIPFeNviWE2bTd4AdsluFspB2kgEj+1Wx9sPG/0fAMitFzEHu1iJFsQbh9MsJ/xKDeybH4HCYObmKspevNncFoKqsrbQ6cvE37dAI7cW24Zxm3jUH0d1u9gc83hxCepzE/tivXVuKwDIcysAykbFSJB+Rrz32pcRwOLwTBMXZa7aYXLYD6tydNuamR5qKt+xzjgvYLunP0mHOQedtpNs/A5l9AtBt5Pwqrj2A3+yfxWps5NVMfZnU7ZTv6rUaUGxROwpU+UHnSoKliz4lI6ijGCZhbT+yKz3CON2brqJAaRodD/ADrTYZPAsGdBvVRHxC0l+1cs3BC3UZD5ZgQD8DB+FeP9gOKnhmPuYfE+BHPdXTyVlP0dzzXU6/Zea9mZOoj8KyvbvsXbxq50ITEKIV/quBsj8/Rtx5jYNgSR6dRqCORHlXFuAz1rxbhvaTiXCiLF62WtAwqXQSsf/FcXl5AkDpvR1fa1ZIBbBPnjldET65JiiPTVE7VFgsSt0TaYOoZkkajMpysB1g6fCvIOIdr+I8SmxhLTW0bRltSWj/5LpjKvX3R1rYWzc4TwbI5BvKHVMniHe3GJWDzygknl4aDG9sr54pxhMNbP0aP3KkfZQlr1wfJz6KtbJvZbw7l3/wD1V/7KC+wzghUXcY6kE/RWpHo1xv8ACv8AzV6dvRWJ/wD5fw8b9/8A9Vf+ysTwgnhXF2tOT3TN3ZJ52rkNbc8tJUk+TCvaprzf24cFz2rWLRZZD3VyPsHVD8GLD9sdKD0TDsYIiDBn5GvI/YGf9bvf3B/xpW/9nvGDicFbZtLiKbd2d8yDRj5suVviawXsItsuLvZlI+gO4I+ulEexT6mujWmM4FAu23GjhcJdurPeEZLUb942gP7Ilv2aivNu2N9uJ8YTC2z9Gj9ypH2UJa9cHXZyD0UVrX9mXDuQv/8AVX/soT7DeAkC7i3EE/RW5kdGuN/hX/mr0/Ko86ow6ey/AEjS/wD9Rf8AsrH8DY8J4ybVxiLLN3bE7G1cg23nbwnKSf1WFezm4eVebe3HgpuWrWLQS1s91cgfUYk2z8GLD9sUHpZeJAGoofxIzv8AYOn7S0M9n3F2xeCtu095bHdXP7SAQx0+suVvUmp+0PFbNqe8uS2QnIniYjMoOg9RQRgxSrL4rtNdP9VbVF63PEx9Ry+dKkAzhti3cuIbbKRmBgmCNa1fB8TdtWrYOoygamRt1ryPg+NHfoVMEsN9I8q9C7N8YYWLUgEZFOU6jahjZYfji7OCv3iiNm4jiVPxBrMW8Tace8EbYA6gzvQywl66bj27j2rdt2thrQXNcZNHYs4IVQZUADXKTMGit5cTMIIV16EA/cdKHPwHBzm/RcOG3k2bcz65aBcP47ft3e5vEXfAblu5ARmVSFdWCjKWGZdQBIPlRI8ZD4uwgchGtYgup0BYd1kPRiJaPjRBe2mUQkKvRQAPkKdbxDD+VV+FX0dLai+Llw2luF8oTvEbQXco8IUkctqZ/S1jwAXVY3ArIFDFmVyVVwoElSVbxRGk7RUF/vAx13p3x+dC73EsP3ndd6mfP3eu3ef7rPGTvP1Jnyqxirgtoz3HCIupLbDl676Dzoq0WjfT7/vprPGo+6h9jjFo22uG4BbU5WJBXK5iEZGAYOZEKRJkVU45xO22Cv3bVyGthQSJRrZzJo6sAUOU8wNDVQVtuanZ2bTU1SwPEMNcdxbuByoLkQwm3/vFzAZ7f6yyu3WupxvDlC63VNtSozAHKxf3VQxFxidMqSZ03qKuJb6/zqUOF23qpg8XburntuGWSpiQVYbqwaGVhI0IB1oY+IbvMWO/7kI2HCPAcJnC5lCsCPGSF9WmgO3HY7mmTUFzG2lR7jXES2jlHZjGVwQpQ882YgR5ihd7tNYzMlpg7qGJYyLa5fezNsI8+lUGwpP8TVHEcXtoYUm645JsPVtqzq8SGJJVr+eBmyAG2Mo0zgGC6a+9qKs8IuWbmi3VEAHKJUlTOVxmAzI0GGEgxQTYvHXbnvtkX7Cb/FtzQfjeEyCTltp3Z8R3nOh9aJY7iS25S2sEDUv72+uUHQ1mO0feXSXDgILTFmYgKDnQjNOmwOlE1AMYpOWzbNxgPEXMaHpGkTSrLP2gW14bY7zUzm9z1TnrSq1AThI+mt9c4rdcEP0Fr+7X8Kx2AT6a3psw/GtjwVf9Xtf3a/hUXF5X60sBi7tkv3Yzo5ZwufIUdveiRDKTruNSaZS38vSijHCsYLl83MVlU92bdsLLZFJDMxMeJ2YLyhQvmauYrhee/auWnVkS3dUidcz93lAHTwHWs8CRyBHUU+1imBlWIOm3loJ60Fv+i79uxZVXNq5bt9zcYHQ2XAW8qnrorKRzQda0XCsZbTFNcAFu3+j2rKZdY7t7jEDouV1+RoBhuL3FjWV2ykSp/hRK1dtONZU76AwRpJ6xOlESph7hwn9HgWmU+EX+9Gtsvn73JGY4jnG2bxZqPcawwu2XQWxcLR9G7m3MEGQ4ByuIzKR9YDUb0AvYWTAYON/DqSOZHnpArlq/dt6K7Bfst4wPKG1H3c6EW14biiLbvNxrOINy0lx1Zzaa2bRW5cUZTcUu7Kxn3QCdZEXFuE3b6Yp8q23u2bVm3bdgZFt2uF7pXwyc5WAT4V31irOF420w9vUf7snX9lv40TXFLcUZQWnbwmR69KEC7eHvXLqPctraFq1eQeMOXe6FWFj3bQyzLQScugim4jg11sPgkWc+FyZkS4bUxaa24t3B7rDNImAYIkTNXMZxAWRBUKxMDO3vdSAss0T5UKx127cABvOBqSqL3a5eUfW+ZoRb4fdt4c3WvMyvcdTka62IukKoVS52VtIhSRAEmg3FL166cR3VtUW69hgXIzfQ5SdBoPdnWrnD+HfZQgc3fSRvJJE+dXrlm3aGa4c/kpiZ6GgBtwpnxQuFzcUt3rqfrX1GS20DQLlIJ/WtpSxnC8mHxFq46q127cuKo8QbVSmePqnKFI3iav4viFy4SltMirvIyt025j+fSh2PUIfpHjQlQolTrqCN1NFLiHELl27bZLNu33YdozB2fvLZQ2zAg24JJ56DSqvBku24a45t2lCgI7i7lYE5lGmYW8sAA8+Qpn9JFZFsBRoRMEqRvB86p3XZ2zOSSdyaII4riaai3bGp+tqB/ZB2FZHtjfdgQzEjumMTpPeW+VH0skiY06nQfOg/aK0CSFU3D3TeSx3lrUn/ACoMTZsk7KT6UqIYpl0DXCSPq2oyr8djXaInwd3I6G6DkzDxAbQd/MUbwPEItolt7LhEAktdB001Hd1mVdl226HX7qkXKTKnu25ch8DynpQHn48Rv3Q/au/+OknHGO3dH9q7/wCOgjuRpdTfUMPuMTHr61Hcw+gZGDem+m+nz1otHB2iI52R+1d/8dPHaJTv3IPUNc+8d399ZV7fX51E9uKFbBuOMFmbJXqGuHy/3eldTtRG3c/F7h+7u6x1m6yGVMH87jnUudH94ZTp4ht5kihXoNjtTeg3FexCblXuSFByk629ZLAUV/00tZrgud1GeFabp2GpK93KL6E7nSvKRbdNVJI0MrqNNRPoRselWP6UZmBuamApYBQSubM0giGOu56CiPY7HaS0UFwC0VXKHIc5VBGYktkBgAR7u7Ci47QKLndAKAyK319M+YTohBAgTtE+deIjiykmGyoWIW3BEKWzAg6hSMq6AVpsJxZXS0e9KPaEK4ygPmi4/eASSrNPhAkEGg21ztBZtsHuomf3AWLkxMHUpAjUmNNCabxXtULY8PdKCCUcl9RyMFP4zOk1m+K4vDLhoZ1DG2WUIQs/q5JmTMTGo3jln8TxzDWwDrdfRioAFotyDzOaB0G80GoTjdxyX0uwDJBuL6GDbjlGmsk9KqXO0KWQc72CxWVGa4wYHcPFuQwgATzM1iOK9pr97w5siSSFTSJMxO9BADQeh43tuWGS2LNtBEeK6W0nUt3fntQ09oZMk2STv4rv/jrMthCv9YQn6p97aR4dwD1NWLSZRKqEBiHfVjP2V+cED40K0a8ZMSxsqOpa6J6x9Hqanw3F2bVFtED67NcC/fbj4a1lxdto05Tccicz8m6hef7Xypii5dYCC55ADaegGiii1rbnaO0oXW3dcTMvdFvyCju5MHWdJobxTiLYgMC1vS2VFu2X1OZG2KADRTrQu3hrYPjuCYmFk6wfCSNmnl51w4toIHg9ND0gneiOHBAe84G+kFiPUDalUCnlSoL1vI/v6ajxepjUR+dajuYUqx0LKDHhOh+zrGgn8IrhMH5/wp1nEsgyjY7g7EeY2+PnQR2HYaSCNSQ22m48jyp2RH909232SdPQN/GrQe3c2i25gEGSpbaRMxsJmBqelVL2HIkxoZjmCZ1CnY9fQ0DrxjS4sGNGXw/5im3MKNSpzALPmJGgI6jymupdZdD4ljQEmIPMdKllTBtsVcEwpMGNhDiJO2lBRuYckTpGoB6xzjp51Xex8qLXXBBDiHkSfd38tBG3Q03F4bLr7ykSGB02gzPQxIjlpQC7Nx0MqSPTp5ip89u5Af6M82UFgdNJWZnz86fesxp+/wDOlQPY11156dOdBDiLQUlQytHNTIPpIBqIE1cGFk6TGum50E8vzoaks4RmOVVk842AO0kaKPXY0FAkmn2bRYgASSYAGpJ5CibYK3bYC6+dtu7tEMZ5AvqszyEmpzYyg52WypAm2stcbY/2tYnxEAGgHnBqsZ3Ab7C+Jp10MaDbnqJGhq4lp7YnSwp0ltbhUyNB73rAWlbvZBNlMmuXOwzPJB5kZUMchrpvpTrGAZ5c6jTM7GBrzZ206ak0FZLoWO7TxDXO8Fp30Gw19TXEwz3CTqx2LGYA5SeQq27W1iFznTqq/uJg9NN9ajxWKd9zA+wnhUdPCPxMmgYiW13lzPugwNDqC3SNRHWmXsQSI0C6aKIBjaep8zXBbPSP4elSLbH8fjQQqOgroUetTAcvj029d6lw+HZyBbQuxMeHUydQIGsxNBENNqVF73BltIGvXMhOUZUGdgSCfEQYA0/MUqAZmB330/PntrUZTbb+FT3rDIdV5AydtQCD5zNRKNdDtrpyEdfLnQR5Dy9f8qlwuIZYnxLI8JJ5emw15cxSnWNQRHPTQbabg61woRtr6eW/y50FgW1cjLCnTQyBm0JVSfOdz51DiMOVJDCD0P7vMdKSYogFdDNSriiRDDOu/mDoNzy022oI0xBgKRmXUAHkD9k+uuum1SWCy62mMmZXXNl6RpI32qzd4fIDIVI5AGSF3Kk7gRtPOhzDKdJ0kzsd4+H+dBYW2rysZLmuhICny5QD92m9RYjDFWymRuZAExGnOPvpLcDCGXNvqJzc+Wzdeu1PVLY0d2KAjKqjxMvqfCsTznnpQcsKgYeE3HnREOhO8MQJIgfVqa6x1W6+RSFJS0NX83Exn6lzOorveXO7It2xaQbssloO2e4TOUwRyGsRUWG4eSC3uoPrPCrykyTr6CTQcGKbRbKBJPvaNdI31uGP/wAgc6hw+FJBbZd5Y6eev4jfWrN+5bUAL4zAyuRC6ajKvPT7UETVS5cYtLMWMnczy+W34UFwXgpjIHgwNwpMEBoEEnXQmDpVW/dZz4jOxA0A0EaKIA2iY9a6oMbac48unl509gB0jrvI9fuoIQhPkPvp+bUmYkazqTSInl5adeVWMPgrjzCsYEkwdtp15ef8qCtGun3a+o/jVmxgndsqKX22GxPXp+FGsNwi0kG4TcLbW0MgmRAVxuSJIA5aHeau3Tc7oW1C27ZlQqzrM5FOpJbKNQNQW5CKCnhuEWbUG++ZjE2x4irjXUjSDABmdJ3mpcTjlX+rTulEe7AkSC2Z4kjxg6QNxyqtbJJyopJJMcjpmI0GpJB3O0+VWMTwi4lvO4GaRCaszTmGijxHRjr+FBWwlsjYagQCemzemqqQI5mlVnCcJuXHBumEdM6GdTqJ8IYQBPnypUEOIwxiCpKeJ4yyVzLl8MnKB5enlQy9gnyZlfMoMSuaRIHI7bEH051u8fwdXE24U75D7pMzI6H7vSgWMwIVzIKvB+0D49COjdY1HzoMncSNxtI1PpptvpNczFdR5nrpEA66GdooviMIrFi3gb3iwzZdJMbkqfWR4hsBQ/G4VrZy6SZ2IYb7ysggjnQQACSOY/ADaanIA0bSOnpz0+E1ERMzJ39fI6bRzNNk7ZZ135bfgaDvess5WIGkwTr+f3VOLysArzJMlgIy8tB8BJqK2Fmc0np92pOgI3+FNA89Y58/T+dBaGGgZ8issECdd9Y3GoGoMb867awDnMwCZBGa4WAVekneeoAJqLDF1ZQDvEgwR9/PXlyrl28zZSSfDMT9UzIjpFBcN61bHgXvX1lnBy7/AFRuwEDUx6UPxF57hzMxYzoDsANOWiwPKuuNT4tDMnqdfv1P30pAHxmaCIp+eVPXTY/5U5mjbWatYDAXb2YW7ZJBEzoA0SM2bbYnaN6CulrMJ90Dc7gDcadI+VWrHDblzL3Yd2JYGF2HI6HUHqRGm9EbuFt2XOY968N4bcAKSPdLEFWbRiRtFT2711v6si2oWAlkECTLQ7akA6giY0NBTThy2j9Ie8fRu7tmDrqMz7J1EfiKuLineFUZEMJkGvh1Yak+OcxBJgCfKmYLhbMq7KukeQIBBgak6kQJ9/WIoo/CBmUXTlAAy2l1cjcyq7eJnM/rDXSgDcNZoyKMwjwgA7j3SAD4YI5nmNKMWOEv71+5lzfVGrMNIWBO0cvnRXD8IuQptBbABJ1ALPO+Y/fOpnnRfhNm2BIRlefEH1fnG+4PI0UP4fw4gfRoLS/aMM5H4D7/AIUSGES2jsSVOUy/vPtuNzIogi67xUWMcKIEAsCAW5nkPvqDO8Pw11lDowskDIDdXO7puCTOmvKu0Ww6tqLjAbGXgCeYWlVFbbypYi0lwQ6z0PMehpzCuI8TzigA8S4QUEjxoAIOsiJ1ZfrHlPnWcxeBlSFiRplJ3ESRJ90zOn8K9HTqKGcW4Kt3xI2R9dRoCepHI+dBgMVgQzEW5zasykjwruABHiETJG8bUO156CCBPToJrScb4W+5Ul094HcjeQw0OvMedCbt8OALigkECQoDdJadNxvofWiKP4+R+VWFw5ysxgZZ8PPTfy6aHrU/9HEn6N1ZTOobaIMEkSvq0a1G9q4ysGDSnvCJMaBY315aUEdq6QIGogdJHoaiLmPLpTkwzkwEbMNYymfgPOjfDuGXWARLej5c2YDL4JYLLabk77zFBlruMIJGXYnnXP6QP2RpsPzvRPhiW/025nFt8pum2j+C29xcxtq2oAWdcsgGAvOtXxjD97w5br28B/VvN4BbD279stOHC2SBcc2yhRSI0YkbUGW7P4u0S5uIzOAMiq0BiTrmYgwo0MQSaOXLt67o/wBHbhptWgYGSSM8mXlebNy21rN9lxNxl5tAiJO5mI1mK3l3BsyqG+jRdvrXCdhHSRygtQAFURkHIiFEvmIgKynQTGby0Oho1h8KwINwhAVyi0AHdkMwGA0kSfFtqafZ4M0llmzaTKVkBrjkZiSo1gmdgCfStFwxbdtQSptsx/2gm4x6ncz5mSOdBV4fw5jr/VL5eK43PU8tSdF260UwXDkt+6uUncnxO3z/AJ1bUqDuAT1In+dPAjXQDqTUU0r5R+PzoOmJUX2dFJRv6y5OhjaJ5D+NX8fjktwo99wck/WY7Ko3J5+gNOsJ3aAuVWBLM0CDzgbKKKr3uPWliDEnKCwIknQBRuxJ0Eb0GTioOIUufo1k960zIBIS2nJRzbn99GMXg1vNbeIyklXI+kM6aT7o5yflQ3FcKWzcDiSjjJLmSuaAQJ60RQxtt795mFqARKm6Z8OkZV+qDvSrR8PYHFXiD7qqniHTkP30qpEDJzqndfLdWfdcZfiNqKug3oT2hQi3mAJKkNp5ch51FWrRIH5mp801Tw13MToRoDB0Inyq0pn1qhuKtBxlbfkfz1rFcd4HBOhGuh9dI9NTW3J/P52pl+2txSh/mPMUR5quFa2Z6SMymMwP1TG/TTrWo7MXka8beJtlZW33fIMdYAgRIEag86ku8MYZgDmgZSI+qdivUfeCKHXMlpl71yCrK1tiSArA852hYogx2vxGGtOkZmYkqSpJyFRI9TMek0Dxj3b4Km62XQ5FEAMMsE6SfMitHiMRbayt3wvnggMRz2MDWYNU+F8Nu3GLuDatgBVzASy8zG4060Hn3DL7WMejqguNav5gmwYo0xI2235b0T4xxibF+zbt3Ct/EfpDs6gBAM2VUCEg+8ZeRIAAAiquO7hb94M7o4vXYdQfCA4C6Dquf5CuvjLZUr+l3chGTJk+poAOnX8mgvezJXNy6LY1yrLEgBRJ1IiW5aArtvW+wGHXxXDcVyNO9PujyXlHpp61jfZ5hrbXr6289xMiQG8IJlvfjdR05nl039rDr3gJUkgbn3VjoNgTP3a0XFfC4XNczwSY0uNo3oojwL99XbVtp8S6dW1Om0D05zNWwI6evM12Y5x97H+FRQnimItWwXgC4Ni6lidRMKNfwp/C74voXa33YkhWkFz5x/s+WlESvKP3k+vSqHDbyfS5TCqxgEaknmCN1JkfCiAqYS0uILLcu2roJAuXlznoYlhAPpRrh9lrnjuOSqsQoIAzEfXIHLpv1oFxfiRYupt2wSF+kZgVWNRlPOfxNEeCYtrdjvLhY2pJ7wxKjQDwzOWqD0gbfM/uFBu1lxRZGePeDAtyy7mOe+1WLXFbbFVtktmOrQRA111iekDrXOM2bbW81wDKpBLMJgbEwagqdjHJS4zE5iw1b3oiR8NeppU7heDupn2cyApYwCkaFTz5A0qKvmuXbYYQRIO9KlVGf7OXCz3S2pBAB5wJgUXA1pUqI5aNNYQxjpSpUUy+58J55svwO4qS5hEcDOoaDAkTp01rtKiO2+F2Vbw21G3LptV2xrIO1dpVB4X2p/8AeYn+/u/42obXKVVHoPsY9/E/2Lf+I16Xd26+tKlRccKQqsCZY660o21Ou550qVRVbF4ULbZgzkxzYkfI6VD2asZEADMczGSTJ90abbUqVBPiuDWT4skNEyCd+vrWU4nhxb7wSzxmIzmdRtoIH3UqVE0TvYRDhlukeNVzK3MMNiKDYHGXMVbU32LgycugWRsYESfWaVKqg22Dz2rNw3LgLWxMNA+AilSpVGn/2Q=="),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0)
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: const LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Spacer(),
                Text("Título", style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),),
                Text("Autor", style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
