--!extension
--!dep Table/bi.BusinessUnit
--!dep Table/md_bi.SKUAdditionalInfo
create or alter view [tbm].[vw_D_SKU]
AS
SELECT        s.ID, ISNULL(s.Name, 'Unknown') COLLATE Cyrillic_General_100_CI_AI AS SKUName, ISNULL(s.CodeManufacturer, 'Unknown') COLLATE Cyrillic_General_100_CI_AI AS SkuCodeManufacturer, ISNULL(b.Name, 
                         'Unknown') COLLATE Cyrillic_General_100_CI_AI AS BrandName, u.Name
FROM            dim.SKU AS s LEFT OUTER JOIN
                         dim.Brand AS b ON b.ID = s.ID_Brand LEFT OUTER JOIN
                         md_bi.SKUAdditionalInfo AS si ON si.ID = s.ID_mapping_MDT LEFT OUTER JOIN
                         bi.BusinessUnit AS u ON u.ID = si.ID_bi_BusinessUnit
WHERE        (s.FlagExclude = 0) AND (s.ID_mapping_DataSource = 1) OR
                         (s.FlagExclude = 0) AND (s.ID = - 1)