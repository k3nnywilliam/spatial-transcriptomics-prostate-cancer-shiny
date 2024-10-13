import scanpy as sc

# Set the path to your 10X data (feature_bc_matrix.h5)
file_path = 'data/human_prostate_cancer/Visium_FFPE_Human_Prostate_IF_filtered_feature_bc_matrix.h5'

# Read the 10X data
adata = sc.read_10x_h5(file_path)

# Access spatial coordinates
spatial_coords = adata.obsm['spatial']
