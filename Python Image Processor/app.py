import streamlit as st 
from PIL import Image
from image_processing import process_image 

uploaded_file = st.file_uploader("Choose an (png) image...", type=['png', 'jpg', 'jpeg'])

if uploaded_file is not None:
    original_image = Image.open(uploaded_file)

    # Checkbox for reverting colors
    invert_color = st.checkbox("Invert Color")

    #Checkbox for 
    remove_black_background = st.checkbox("Remove Background")
    background_removal_threshold = -1.0
    if remove_black_background:
        background_removal_threshold = st.slider("Background Removal Threshold", min_value=0.0, max_value=0.3, value=0.05)
        
    processed_image = process_image(original_image, invert_color, background_removal_threshold)

    original_widget, processed_widget = st.columns(2)
    with original_widget:
        st.image(original_image, caption="Original")
    with processed_widget:
        st.image(processed_image, output_format="PNG", caption="Processed")

else:
    st.write("Please upload an image to get started")
