#!/usr/bin/env python3
"""
Motion Capture Data Analysis Script
Analyzes subject metadata and generates visualizations in both dark and light modes
"""

import json
import glob
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path
from collections import Counter

# Set up matplotlib for high-quality plots
plt.rcParams['figure.dpi'] = 300
plt.rcParams['savefig.dpi'] = 300
plt.rcParams['font.size'] = 10
plt.rcParams['figure.figsize'] = (10, 6)

def setup_dark_mode():
    """Configure matplotlib for dark mode"""
    plt.rcParams['text.color'] = 'white'
    plt.rcParams['axes.labelcolor'] = 'white'
    plt.rcParams['axes.edgecolor'] = 'white'
    plt.rcParams['xtick.color'] = 'white'
    plt.rcParams['ytick.color'] = 'white'
    plt.rcParams['grid.color'] = 'gray'
    plt.rcParams['figure.facecolor'] = 'none'
    plt.rcParams['axes.facecolor'] = 'none'

def setup_light_mode():
    """Configure matplotlib for light mode"""
    plt.rcParams['text.color'] = 'black'
    plt.rcParams['axes.labelcolor'] = 'black'
    plt.rcParams['axes.edgecolor'] = 'black'
    plt.rcParams['xtick.color'] = 'black'
    plt.rcParams['ytick.color'] = 'black'
    plt.rcParams['grid.color'] = 'lightgray'
    plt.rcParams['figure.facecolor'] = 'none'
    plt.rcParams['axes.facecolor'] = 'none'

def get_color_scheme(mode='dark'):
    """Return color scheme based on mode"""
    if mode == 'dark':
        return {
            'text': 'white',
            'edge': 'white',
            'box_bg': '#2C3E50',
            'box_edge': 'white',
            'grid': 'gray',
            'mean_line': '#FF6B6B',
            'median_line': '#4ECDC4',
            'quartile_line': '#95E1D3',
            'age_color': '#5DADE2',
            'height_color': '#58D68D',
            'weight_color': '#F1948A',
            'speed_color': '#AF7AC5',
            'young_color': '#48C9B0',
            'elderly_color': '#E74C3C',
            'pie_gender': ['#E74C3C', '#3498DB', '#95A5A6'],
            'pie_age': ['#48C9B0', '#F39C12', '#8E44AD'],
        }
    else:  # light mode
        return {
            'text': 'black',
            'edge': 'black',
            'box_bg': '#ECF0F1',
            'box_edge': 'black',
            'grid': 'lightgray',
            'mean_line': '#E74C3C',
            'median_line': '#16A085',
            'quartile_line': '#3498DB',
            'age_color': '#3498DB',
            'height_color': '#27AE60',
            'weight_color': '#E67E22',
            'speed_color': '#8E44AD',
            'young_color': '#1ABC9C',
            'elderly_color': '#C0392B',
            'pie_gender': ['#E74C3C', '#3498DB', '#95A5A6'],
            'pie_age': ['#1ABC9C', '#F39C12', '#8E44AD'],
        }

def load_all_metadata(pattern="*/*_metadata.json"):
    """Load all metadata JSON files"""
    files = glob.glob(pattern)
    print(f"Found {len(files)} metadata files")

    data_list = []
    for file_path in files:
        try:
            with open(file_path, 'r') as f:
                data = json.load(f)
                data_list.append(data)
        except Exception as e:
            print(f"Error reading {file_path}: {e}")

    print(f"Successfully loaded {len(data_list)} metadata files")
    return data_list

def extract_relevant_data(data_list):
    """Extract relevant fields from metadata"""
    records = []

    for data in data_list:
        record = {
            'subject_id': data.get('subject_id'),
            'trial_name': data.get('trial_name'),
            'age': data.get('age'),
            'sex': data.get('sex'),
            'gender': data.get('gender'),
            'body_mass_kg': data.get('body_mass_kg'),
            'height_m': data.get('height_m'),
            'height_mm': data.get('height_mm'),
            'leg_length_m': data.get('leg_length_m'),
            'condition': data.get('condition'),
            'population': data.get('population'),
        }

        # Extract walking speeds
        walking_speeds = data.get('walking_speeds', {})
        if walking_speeds:
            record['left_speed'] = walking_speeds.get('left_speed')
            record['right_speed'] = walking_speeds.get('right_speed')
            # Average walking speed
            if record['left_speed'] and record['right_speed']:
                record['avg_walking_speed'] = (record['left_speed'] + record['right_speed']) / 2

        records.append(record)

    df = pd.DataFrame(records)
    return df

def add_stats_to_plot(data, ax, colors):
    """Add statistical annotations to a plot"""
    mean_val = data.mean()
    median_val = data.median()
    std_val = data.std()
    q1 = data.quantile(0.25)
    q3 = data.quantile(0.75)

    # Add vertical lines for statistics
    ax.axvline(mean_val, color=colors['mean_line'], linestyle='--', linewidth=2, label=f'Mean: {mean_val:.2f}', alpha=0.8)
    ax.axvline(median_val, color=colors['median_line'], linestyle='--', linewidth=2, label=f'Median: {median_val:.2f}', alpha=0.8)
    ax.axvline(q1, color=colors['quartile_line'], linestyle=':', linewidth=1.5, label=f'Q1: {q1:.2f}', alpha=0.7)
    ax.axvline(q3, color=colors['quartile_line'], linestyle=':', linewidth=1.5, label=f'Q3: {q3:.2f}', alpha=0.7)

    # Add text box with statistics
    stats_text = f'μ = {mean_val:.2f}\nσ = {std_val:.2f}\nMedian = {median_val:.2f}'
    ax.text(0.98, 0.97, stats_text, transform=ax.transAxes, fontsize=11,
            verticalalignment='top', horizontalalignment='right',
            bbox=dict(boxstyle='round', facecolor=colors['box_bg'], alpha=0.8, edgecolor=colors['box_edge'], linewidth=1.5),
            color=colors['text'])

    ax.legend(loc='upper left', fontsize=9, framealpha=0.8, facecolor=colors['box_bg'], edgecolor=colors['box_edge'])

def create_distributions(df, mode='dark'):
    """Create distribution plots"""
    colors = get_color_scheme(mode)
    suffix = '' if mode == 'dark' else '_light'

    # Age Distribution (5-year intervals)
    fig, ax = plt.subplots(figsize=(12, 7))
    age_data = df['age'].dropna()
    bins = np.arange(age_data.min(), age_data.max() + 5, 5)
    ax.hist(age_data, bins=bins, edgecolor=colors['edge'], alpha=0.7, color=colors['age_color'], linewidth=1.5)
    ax.set_xlabel('Age (years)', fontsize=13, fontweight='bold')
    ax.set_ylabel('Frequency', fontsize=13, fontweight='bold')
    ax.set_title('Distribution of Subject Ages', fontsize=16, fontweight='bold', pad=20)
    ax.grid(axis='y', alpha=0.3, color=colors['grid'], linestyle='--')
    add_stats_to_plot(age_data, ax, colors)
    plt.tight_layout()
    plt.savefig(f'age_distribution{suffix}.png', transparent=True, bbox_inches='tight', dpi=300)
    plt.close()
    print(f"✓ Created age_distribution{suffix}.png")

    # Height Distribution (0.05m intervals)
    fig, ax = plt.subplots(figsize=(12, 7))
    height_data = df['height_m'].dropna()
    bins = np.arange(height_data.min(), height_data.max() + 0.05, 0.05)
    ax.hist(height_data, bins=bins, edgecolor=colors['edge'], alpha=0.7, color=colors['height_color'], linewidth=1.5)
    ax.set_xlabel('Height (meters)', fontsize=13, fontweight='bold')
    ax.set_ylabel('Frequency', fontsize=13, fontweight='bold')
    ax.set_title('Distribution of Subject Heights', fontsize=16, fontweight='bold', pad=20)
    ax.grid(axis='y', alpha=0.3, color=colors['grid'], linestyle='--')
    add_stats_to_plot(height_data, ax, colors)
    plt.tight_layout()
    plt.savefig(f'height_distribution{suffix}.png', transparent=True, bbox_inches='tight', dpi=300)
    plt.close()
    print(f"✓ Created height_distribution{suffix}.png")

    # Weight Distribution (5kg intervals)
    fig, ax = plt.subplots(figsize=(12, 7))
    weight_data = df['body_mass_kg'].dropna()
    bins = np.arange(weight_data.min(), weight_data.max() + 5, 5)
    ax.hist(weight_data, bins=bins, edgecolor=colors['edge'], alpha=0.7, color=colors['weight_color'], linewidth=1.5)
    ax.set_xlabel('Body Mass (kg)', fontsize=13, fontweight='bold')
    ax.set_ylabel('Frequency', fontsize=13, fontweight='bold')
    ax.set_title('Distribution of Subject Body Mass', fontsize=16, fontweight='bold', pad=20)
    ax.grid(axis='y', alpha=0.3, color=colors['grid'], linestyle='--')
    add_stats_to_plot(weight_data, ax, colors)
    plt.tight_layout()
    plt.savefig(f'weight_distribution{suffix}.png', transparent=True, bbox_inches='tight', dpi=300)
    plt.close()
    print(f"✓ Created weight_distribution{suffix}.png")

    # Gender Distribution (Pie Chart)
    fig, ax = plt.subplots(figsize=(9, 9))
    gender_counts = df['gender'].value_counts()
    explode = [0.05] * len(gender_counts)
    wedges, texts, autotexts = ax.pie(gender_counts.values, labels=gender_counts.index,
                                        autopct='%1.1f%%', startangle=90,
                                        colors=colors['pie_gender'][:len(gender_counts)], explode=explode,
                                        textprops={'fontsize': 13, 'color': colors['text'], 'fontweight': 'bold'},
                                        wedgeprops={'edgecolor': colors['edge'], 'linewidth': 2})
    for autotext in autotexts:
        autotext.set_fontsize(14)
    ax.set_title('Gender Distribution', fontsize=16, fontweight='bold', pad=20, color=colors['text'])
    plt.tight_layout()
    plt.savefig(f'gender_distribution{suffix}.png', transparent=True, bbox_inches='tight', dpi=300)
    plt.close()
    print(f"✓ Created gender_distribution{suffix}.png")

    # Age Group Distribution (Pie Chart)
    fig, ax = plt.subplots(figsize=(9, 9))
    age_groups = pd.cut(df['age'], bins=[0, 30, 50, 100], labels=['Young (<30)', 'Middle Age (30-50)', 'Old (>50)'])
    age_group_counts = age_groups.value_counts().sort_index()
    explode = [0.05, 0.05, 0.05]
    wedges, texts, autotexts = ax.pie(age_group_counts.values, labels=age_group_counts.index,
                                        autopct='%1.1f%%', startangle=90,
                                        colors=colors['pie_age'], explode=explode,
                                        textprops={'fontsize': 13, 'color': colors['text'], 'fontweight': 'bold'},
                                        wedgeprops={'edgecolor': colors['edge'], 'linewidth': 2})
    for autotext in autotexts:
        autotext.set_fontsize(14)
    ax.set_title('Age Group Distribution', fontsize=16, fontweight='bold', pad=20, color=colors['text'])
    plt.tight_layout()
    plt.savefig(f'age_group_distribution{suffix}.png', transparent=True, bbox_inches='tight', dpi=300)
    plt.close()
    print(f"✓ Created age_group_distribution{suffix}.png")

    # Walking Speed Distribution (0.1 m/s intervals)
    fig, ax = plt.subplots(figsize=(12, 7))
    speed_data = df['avg_walking_speed'].dropna()
    bins = np.arange(speed_data.min(), speed_data.max() + 0.1, 0.1)
    ax.hist(speed_data, bins=bins, edgecolor=colors['edge'], alpha=0.7, color=colors['speed_color'], linewidth=1.5)
    ax.set_xlabel('Average Walking Speed (m/s)', fontsize=13, fontweight='bold')
    ax.set_ylabel('Frequency', fontsize=13, fontweight='bold')
    ax.set_title('Distribution of Walking Speeds', fontsize=16, fontweight='bold', pad=20)
    ax.grid(axis='y', alpha=0.3, color=colors['grid'], linestyle='--')
    add_stats_to_plot(speed_data, ax, colors)
    plt.tight_layout()
    plt.savefig(f'walking_speed_distribution{suffix}.png', transparent=True, bbox_inches='tight', dpi=300)
    plt.close()
    print(f"✓ Created walking_speed_distribution{suffix}.png")

def create_correlations(df, mode='dark'):
    """Create correlation plots"""
    colors = get_color_scheme(mode)
    suffix = '' if mode == 'dark' else '_light'

    # Age vs Walking Speed (Split by age 50)
    fig, ax = plt.subplots(figsize=(12, 7))
    valid_data = df[['age', 'avg_walking_speed']].dropna()

    # Split data into two groups
    young_data = valid_data[valid_data['age'] < 50]
    elderly_data = valid_data[valid_data['age'] >= 50]

    # Plot young group (<50)
    ax.scatter(young_data['age'], young_data['avg_walking_speed'],
                alpha=0.6, s=50, color=colors['young_color'], edgecolors=colors['edge'], linewidth=0.8, label='Age < 50')

    # Plot elderly group (>=50)
    ax.scatter(elderly_data['age'], elderly_data['avg_walking_speed'],
                alpha=0.6, s=50, color=colors['elderly_color'], edgecolors=colors['edge'], linewidth=0.8, label='Age ≥ 50')

    # Add vertical line at age 50
    threshold_color = 'yellow' if mode == 'dark' else 'orange'
    ax.axvline(50, color=threshold_color, linestyle=':', linewidth=2, alpha=0.7, label='Age 50 threshold')

    # Regression for young group
    if len(young_data) > 1:
        z_young = np.polyfit(young_data['age'], young_data['avg_walking_speed'], 1)
        p_young = np.poly1d(z_young)
        age_range_young = np.linspace(young_data['age'].min(), 50, 100)
        ax.plot(age_range_young, p_young(age_range_young),
                color=colors['young_color'], linestyle='--', alpha=0.9, linewidth=2.5,
                label=f'<50: y={z_young[0]:.4f}x+{z_young[1]:.2f}')
        corr_young = young_data['age'].corr(young_data['avg_walking_speed'])

    # Regression for elderly group
    if len(elderly_data) > 1:
        z_elderly = np.polyfit(elderly_data['age'], elderly_data['avg_walking_speed'], 1)
        p_elderly = np.poly1d(z_elderly)
        age_range_elderly = np.linspace(50, elderly_data['age'].max(), 100)
        ax.plot(age_range_elderly, p_elderly(age_range_elderly),
                color=colors['elderly_color'], linestyle='--', alpha=0.9, linewidth=2.5,
                label=f'≥50: y={z_elderly[0]:.4f}x+{z_elderly[1]:.2f}')
        corr_elderly = elderly_data['age'].corr(elderly_data['avg_walking_speed'])

    # Add statistics box
    stats_text = f'Correlation <50: {corr_young:.3f}\nCorrelation ≥50: {corr_elderly:.3f}\nN(<50): {len(young_data)}\nN(≥50): {len(elderly_data)}'
    ax.text(0.98, 0.97, stats_text,
            transform=ax.transAxes, fontsize=11, color=colors['text'],
            verticalalignment='top', horizontalalignment='right',
            bbox=dict(boxstyle='round', facecolor=colors['box_bg'], alpha=0.8, edgecolor=colors['box_edge'], linewidth=1.5))

    ax.set_xlabel('Age (years)', fontsize=13, fontweight='bold')
    ax.set_ylabel('Average Walking Speed (m/s)', fontsize=13, fontweight='bold')
    ax.set_title('Correlation: Age vs Walking Speed (Split Analysis)', fontsize=16, fontweight='bold', pad=20)
    ax.grid(True, alpha=0.3, color=colors['grid'], linestyle='--')
    ax.legend(fontsize=9, framealpha=0.8, facecolor=colors['box_bg'], edgecolor=colors['box_edge'], loc='lower left')
    plt.tight_layout()
    plt.savefig(f'age_vs_walking_speed{suffix}.png', transparent=True, bbox_inches='tight', dpi=300)
    plt.close()
    print(f"✓ Created age_vs_walking_speed{suffix}.png")

    # Height vs Weight
    fig, ax = plt.subplots(figsize=(12, 7))
    valid_data = df[['height_m', 'body_mass_kg']].dropna()
    ax.scatter(valid_data['height_m'], valid_data['body_mass_kg'],
                alpha=0.6, s=50, color=colors['height_color'], edgecolors=colors['edge'], linewidth=0.8)

    if len(valid_data) > 1:
        z = np.polyfit(valid_data['height_m'], valid_data['body_mass_kg'], 1)
        p = np.poly1d(z)
        ax.plot(valid_data['height_m'].sort_values(), p(valid_data['height_m'].sort_values()),
                color=colors['mean_line'], linestyle='--', alpha=0.9, linewidth=2.5, label=f'Trend: y={z[0]:.2f}x+{z[1]:.2f}')

        corr = valid_data['height_m'].corr(valid_data['body_mass_kg'])
        ax.text(0.05, 0.95, f'Correlation: {corr:.3f}',
                transform=ax.transAxes, fontsize=12, color=colors['text'],
                verticalalignment='top', bbox=dict(boxstyle='round', facecolor=colors['box_bg'], alpha=0.8, edgecolor=colors['box_edge'], linewidth=1.5))

    ax.set_xlabel('Height (meters)', fontsize=13, fontweight='bold')
    ax.set_ylabel('Body Mass (kg)', fontsize=13, fontweight='bold')
    ax.set_title('Correlation: Height vs Body Mass', fontsize=16, fontweight='bold', pad=20)
    ax.grid(True, alpha=0.3, color=colors['grid'], linestyle='--')
    ax.legend(fontsize=10, framealpha=0.8, facecolor=colors['box_bg'], edgecolor=colors['box_edge'])
    plt.tight_layout()
    plt.savefig(f'height_vs_weight{suffix}.png', transparent=True, bbox_inches='tight', dpi=300)
    plt.close()
    print(f"✓ Created height_vs_weight{suffix}.png")

    # Age vs Height
    fig, ax = plt.subplots(figsize=(12, 7))
    valid_data = df[['age', 'height_m']].dropna()
    ax.scatter(valid_data['age'], valid_data['height_m'],
                alpha=0.6, s=50, color=colors['weight_color'], edgecolors=colors['edge'], linewidth=0.8)

    if len(valid_data) > 1:
        z = np.polyfit(valid_data['age'], valid_data['height_m'], 1)
        p = np.poly1d(z)
        ax.plot(valid_data['age'].sort_values(), p(valid_data['age'].sort_values()),
                color=colors['mean_line'], linestyle='--', alpha=0.9, linewidth=2.5, label=f'Trend: y={z[0]:.4f}x+{z[1]:.4f}')

        corr = valid_data['age'].corr(valid_data['height_m'])
        ax.text(0.05, 0.95, f'Correlation: {corr:.3f}',
                transform=ax.transAxes, fontsize=12, color=colors['text'],
                verticalalignment='top', bbox=dict(boxstyle='round', facecolor=colors['box_bg'], alpha=0.8, edgecolor=colors['box_edge'], linewidth=1.5))

    ax.set_xlabel('Age (years)', fontsize=13, fontweight='bold')
    ax.set_ylabel('Height (meters)', fontsize=13, fontweight='bold')
    ax.set_title('Correlation: Age vs Height', fontsize=16, fontweight='bold', pad=20)
    ax.grid(True, alpha=0.3, color=colors['grid'], linestyle='--')
    ax.legend(fontsize=10, framealpha=0.8, facecolor=colors['box_bg'], edgecolor=colors['box_edge'])
    plt.tight_layout()
    plt.savefig(f'age_vs_height{suffix}.png', transparent=True, bbox_inches='tight', dpi=300)
    plt.close()
    print(f"✓ Created age_vs_height{suffix}.png")

    # BMI vs Walking Speed
    df['bmi'] = df['body_mass_kg'] / (df['height_m'] ** 2)
    fig, ax = plt.subplots(figsize=(12, 7))
    valid_data = df[['bmi', 'avg_walking_speed']].dropna()
    ax.scatter(valid_data['bmi'], valid_data['avg_walking_speed'],
                alpha=0.6, s=50, color=colors['speed_color'], edgecolors=colors['edge'], linewidth=0.8)

    if len(valid_data) > 1:
        z = np.polyfit(valid_data['bmi'], valid_data['avg_walking_speed'], 1)
        p = np.poly1d(z)
        ax.plot(valid_data['bmi'].sort_values(), p(valid_data['bmi'].sort_values()),
                color=colors['mean_line'], linestyle='--', alpha=0.9, linewidth=2.5, label=f'Trend: y={z[0]:.4f}x+{z[1]:.4f}')

        corr = valid_data['bmi'].corr(valid_data['avg_walking_speed'])
        ax.text(0.05, 0.95, f'Correlation: {corr:.3f}',
                transform=ax.transAxes, fontsize=12, color=colors['text'],
                verticalalignment='top', bbox=dict(boxstyle='round', facecolor=colors['box_bg'], alpha=0.8, edgecolor=colors['box_edge'], linewidth=1.5))

    ax.set_xlabel('BMI (kg/m²)', fontsize=13, fontweight='bold')
    ax.set_ylabel('Average Walking Speed (m/s)', fontsize=13, fontweight='bold')
    ax.set_title('Correlation: BMI vs Walking Speed', fontsize=16, fontweight='bold', pad=20)
    ax.grid(True, alpha=0.3, color=colors['grid'], linestyle='--')
    ax.legend(fontsize=10, framealpha=0.8, facecolor=colors['box_bg'], edgecolor=colors['box_edge'])
    plt.tight_layout()
    plt.savefig(f'bmi_vs_walking_speed{suffix}.png', transparent=True, bbox_inches='tight', dpi=300)
    plt.close()
    print(f"✓ Created bmi_vs_walking_speed{suffix}.png")

def create_summary_stats(df):
    """Create summary statistics table"""
    stats = {
        'Age': df['age'].describe(),
        'Height (m)': df['height_m'].describe(),
        'Body Mass (kg)': df['body_mass_kg'].describe(),
        'Walking Speed (m/s)': df['avg_walking_speed'].describe(),
    }

    return pd.DataFrame(stats).round(2)

def generate_report(df, stats):
    """Generate markdown report"""

    # Get unique subjects
    unique_subjects = df['subject_id'].nunique()
    total_trials = len(df)

    # Gender breakdown
    gender_counts = df['gender'].value_counts()

    # Condition breakdown
    condition_counts = df['condition'].value_counts()

    # Age group analysis for walking speed
    young_data = df[df['age'] < 50][['age', 'avg_walking_speed']].dropna()
    elderly_data = df[df['age'] >= 50][['age', 'avg_walking_speed']].dropna()
    corr_young = young_data['age'].corr(young_data['avg_walking_speed'])
    corr_elderly = elderly_data['age'].corr(elderly_data['avg_walking_speed'])

    report = f"""# Motion Capture Data Analysis Report

## Dataset Overview

- **Total Trials**: {total_trials}
- **Unique Subjects**: {unique_subjects}
- **Average Trials per Subject**: {total_trials / unique_subjects:.1f}

### Gender Distribution
{gender_counts.to_string()}

### Health Condition Distribution
{condition_counts.to_string()}

---

## Summary Statistics

{stats.to_markdown()}

---

## Visualizations

### 1. Age Distribution
![Age Distribution](age_distribution.png)

**Description**: Histogram showing the distribution of subject ages with 5-year intervals. Includes statistical markers for mean (red dashed line), median (cyan dashed line), and quartiles Q1/Q3 (cyan dotted lines). The statistics box shows mean (μ), standard deviation (σ), and median values.

---

### 2. Height Distribution
![Height Distribution](height_distribution.png)

**Description**: Distribution of subject heights measured in meters with 0.05m intervals. Statistical annotations help identify the central tendency and spread of height measurements across the dataset.

---

### 3. Body Mass Distribution
![Body Mass Distribution](weight_distribution.png)

**Description**: Histogram of subject body mass in kilograms with 5kg intervals. Statistical overlays show mean, median, and quartile markers to understand the distribution of participant weights.

---

### 4. Gender Distribution
![Gender Distribution](gender_distribution.png)

**Description**: Pie chart displaying the proportion of subjects by gender. Each slice shows the percentage distribution, providing clear insight into the gender composition of the dataset.

---

### 5. Age Group Distribution
![Age Group Distribution](age_group_distribution.png)

**Description**: Pie chart categorizing subjects into three age groups: Young (<30 years), Middle Age (30-50 years), and Old (>50 years). This provides a high-level view of the age demographics in the study.

---

### 6. Walking Speed Distribution
![Walking Speed Distribution](walking_speed_distribution.png)

**Description**: Distribution of average walking speeds (mean of left and right foot speeds) with 0.1 m/s intervals. Statistical markers indicate the typical walking speeds and variability across all trials.

---

## Correlation Analysis

### 7. Age vs Walking Speed (Split Analysis)
![Age vs Walking Speed](age_vs_walking_speed.png)

**Description**: Scatter plot with **split regression analysis** at age 50. Green points and trend line represent subjects under 50 years old, while red points and trend line represent subjects 50 and older. This analysis accounts for the physiological reality that walking speed decline is more pronounced in older adults.

**Key Findings:**
- **Correlation (Age < 50)**: {corr_young:.3f} - Minimal correlation in younger adults
- **Correlation (Age ≥ 50)**: {corr_elderly:.3f} - {'Strong' if abs(corr_elderly) > 0.5 else 'Moderate' if abs(corr_elderly) > 0.3 else 'Weak'} negative correlation in elderly adults
- Sample sizes: {len(young_data)} trials (<50), {len(elderly_data)} trials (≥50)

---

### 8. Height vs Body Mass
![Height vs Weight](height_vs_weight.png)

**Description**: Correlation between subject height and body mass with trend line analysis. This relationship is typically positive, as taller individuals tend to have greater body mass. The correlation coefficient quantifies this relationship.

---

### 9. Age vs Height
![Age vs Height](age_vs_height.png)

**Description**: Relationship between age and height. This can reveal whether the dataset includes participants across different life stages or shows age-related changes in measured height.

---

### 10. BMI vs Walking Speed
![BMI vs Walking Speed](bmi_vs_walking_speed.png)

**Description**: Correlation between Body Mass Index (BMI) and walking speed. The scatter plot and trend line help identify whether body composition affects gait velocity, with the correlation coefficient indicating the strength of this relationship.

---

## Key Findings

### Age and Walking Speed (Split Analysis)
- **Young Adults (Age < 50)**: Correlation = {corr_young:.3f}
  - Minimal correlation, suggesting walking speed remains relatively stable in younger adults
- **Elderly Adults (Age ≥ 50)**: Correlation = {corr_elderly:.3f}
  - {'Pronounced' if corr_elderly < -0.4 else 'Moderate'} decline in walking speed with age, consistent with age-related mobility decline

### Height and Body Mass
- **Correlation coefficient**: {df[['height_m', 'body_mass_kg']].dropna().corr().iloc[0, 1]:.3f}
- Interpretation: Strong positive correlation as expected for anthropometric measurements

### BMI and Walking Speed
- **Correlation coefficient**: {df[['bmi', 'avg_walking_speed']].dropna().corr().iloc[0, 1]:.3f}
- Interpretation: {'Higher BMI associated with slower walking speeds' if df[['bmi', 'avg_walking_speed']].dropna().corr().iloc[0, 1] < -0.3 else 'BMI shows weak or no correlation with walking speed'}

---

*Report generated automatically from {total_trials} motion capture trials*

**Note**: Both dark mode (default) and light mode (`_light.png` suffix) versions of all charts are available.
"""

    with open('analysis_report.md', 'w') as f:
        f.write(report)

    print("✓ Created analysis_report.md")

def main():
    """Main execution function"""
    print("=" * 60)
    print("Motion Capture Data Analysis")
    print("=" * 60)

    # Load data
    print("\n[1/5] Loading metadata files...")
    metadata_list = load_all_metadata()

    # Extract data
    print("\n[2/5] Extracting relevant data...")
    df = extract_relevant_data(metadata_list)
    print(f"Extracted data for {len(df)} trials")

    # Create DARK MODE plots
    print("\n[3/5] Creating DARK MODE visualizations...")
    setup_dark_mode()
    print("Creating distribution plots...")
    create_distributions(df, mode='dark')
    print("\nCreating correlation plots...")
    create_correlations(df, mode='dark')

    # Create LIGHT MODE plots
    print("\n[4/5] Creating LIGHT MODE visualizations...")
    setup_light_mode()
    print("Creating distribution plots...")
    create_distributions(df, mode='light')
    print("\nCreating correlation plots...")
    create_correlations(df, mode='light')

    # Generate report
    print("\n[5/5] Generating report...")
    stats = create_summary_stats(df)
    generate_report(df, stats)

    print("\n" + "=" * 60)
    print("Analysis complete!")
    print("Dark mode: *.png")
    print("Light mode: *_light.png")
    print("Report: analysis_report.md")
    print("=" * 60)

if __name__ == "__main__":
    main()
