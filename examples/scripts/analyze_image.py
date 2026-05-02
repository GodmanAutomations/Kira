#!/usr/bin/env python3
"""
Image analysis module for Athena.
"""

import google.generativeai as genai
from pathlib import Path
from gemini_client import get_client

def analyze_image(image_path: str, mode: str = "general") -> str:
    """Analyze an image using Gemini."""
    client = get_client()
    try:
        sample_file = genai.upload_file(path=str(image_path))
        prompt = "Analyze this image in detail."
        if mode != "general":
            prompt = f"Analyze this image with focus on {mode}."
            
        response = client.model.generate_content([prompt, sample_file])
        
        # Cleanup
        try:
            genai.delete_file(sample_file.name)
        except Exception:
            pass
            
        return response.text
    except Exception as e:
        return f"Image analysis error: {str(e)}"
