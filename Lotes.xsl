<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>

	<xsl:template match="Pedidos">
		<Pedidos>
			<xsl:for-each select="/Pedidos/Pedido">
				<Pedido>
					<xsl:apply-templates select="cabecera"></xsl:apply-templates>
					<xsl:apply-templates select="destino"></xsl:apply-templates>
					<xsl:apply-templates select="lineas"></xsl:apply-templates>
				</Pedido>

			</xsl:for-each>
		</Pedidos>
	</xsl:template>

	<xsl:template match="cabecera">
		<cabecera>
			<numero_pedido>
				<xsl:value-of select="numero_pedido" />
			</numero_pedido>
			<fecha_pedido>
				<xsl:value-of select="fecha_pedido" />
			</fecha_pedido>
			<fecha_salida_almacen>
				<xsl:value-of select="fecha_salida_almacen" />
			</fecha_salida_almacen>
			<fecha_entrega>
				<xsl:value-of select="fecha_entrega" />
			</fecha_entrega>
			<estado>
				<xsl:value-of select="estado" />
			</estado>
			<descripcion_estado>
				<xsl:value-of select="descripcion_estado" />
			</descripcion_estado>
		</cabecera>
	</xsl:template>


	<xsl:template match="destino">
		<destino>
			<cliente>
				<codigo>
					<xsl:value-of select="cliente/codigo" />
				</codigo>
				<razon_social>
					<xsl:value-of select="cliente/razon_social" />
				</razon_social>
				<nif>
					<xsl:value-of select="cliente/nif" />
				</nif>
				<direccion>
					<xsl:value-of select="cliente/direccion" />
				</direccion>
				<codigo_postal>
					<xsl:value-of select="cliente/codigo_postal" />
				</codigo_postal>
				<poblacion>
					<xsl:value-of select="cliente/poblacion" />
				</poblacion>
				<provincia>
					<xsl:value-of select="cliente/provincia" />
				</provincia>
				<pais>
					<xsl:value-of select="cliente/pais" />
				</pais>
				<telefono>
					<xsl:value-of select="cliente/telefono" />
				</telefono>
				<fax>
					<xsl:value-of select="cliente/fax" />
				</fax>
				<persona_contacto>
					<xsl:value-of select="cliente/persona_contacto" />
				</persona_contacto>
				<mail>
					<xsl:value-of select="cliente/mail" />
				</mail>
			</cliente>
		</destino>
	</xsl:template>
	<xsl:template match="lineas">
		<lineas>
			<xsl:apply-templates select="linea"></xsl:apply-templates>
		</lineas>
	</xsl:template>

	<xsl:template match="linea">
		<xsl:if test="count(./lotes/lote)=0">

			<linea>
				<codigo_articulo>
					<xsl:value-of select="codigo_articulo" />
				</codigo_articulo>
				<num_linea>
					<xsl:value-of select="num_linea" />
				</num_linea>
				<num_entrega>
					<xsl:value-of select="num_entrega" />
				</num_entrega>
				<cod_interno_articulo>
					<xsl:value-of select="cod_interno_articulo" />
				</cod_interno_articulo>
				<descripcion>
					<xsl:value-of select="descripcion" />
				</descripcion>
				<ean>
					<xsl:value-of select="ean" />
				</ean>
				<cantidad>
					<xsl:value-of select="cantidad" />
				</cantidad>
				<lotes>
					<lote>
						<numero>
							0
						</numero>
						<unidades>
							<xsl:value-of select="cantidad" />
						</unidades>
					</lote>
				</lotes>
			</linea>
		</xsl:if>
		<xsl:for-each select="./lotes/lote">
			<linea>
				<codigo_articulo>
					<xsl:value-of select="../../codigo_articulo" />
				</codigo_articulo>
				<num_linea>
					<xsl:value-of select="../../num_linea" />
				</num_linea>
				<num_entrega>
					<xsl:value-of select="../../num_entrega" />
				</num_entrega>
				<cod_interno_articulo>
					<xsl:value-of select="../../cod_interno_articulo" />
				</cod_interno_articulo>
				<descripcion>
					<xsl:value-of select="../../descripcion" />
				</descripcion>
				<ean>
					<xsl:value-of select="../../ean" />
				</ean>
				<cantidad>
					<xsl:value-of select="../../cantidad" />
				</cantidad>
				<lotes>
					<lote>
						<numero>
							<xsl:value-of select="numero" />
						</numero>
						<unidades>
							<xsl:value-of select="unidades" />
						</unidades>
					</lote>
				</lotes>
			</linea>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>