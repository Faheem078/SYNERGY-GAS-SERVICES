-- ============================================
-- Synergy Gas Services - MySQL Database Schema
-- ============================================

CREATE DATABASE IF NOT EXISTS synergy_gas_db;
USE synergy_gas_db;

-- ----------------------------------------
-- Table: contacts (Contact Form Submissions)
-- ----------------------------------------
CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(20),
    service_type VARCHAR(100),
    message TEXT NOT NULL,
    status ENUM('new', 'read', 'replied') DEFAULT 'new',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------------------
-- Table: services
-- ----------------------------------------
CREATE TABLE IF NOT EXISTS services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    icon VARCHAR(50),
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------------------
-- Table: projects
-- ----------------------------------------
CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    location VARCHAR(150),
    image_url VARCHAR(255),
    completed_date DATE,
    is_featured TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------------------
-- Table: testimonials
-- ----------------------------------------
CREATE TABLE IF NOT EXISTS testimonials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    review TEXT NOT NULL,
    rating TINYINT CHECK (rating BETWEEN 1 AND 5),
    location VARCHAR(100),
    is_approved TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------------------
-- Table: team_members
-- ----------------------------------------
CREATE TABLE IF NOT EXISTS team_members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(100),
    bio TEXT,
    image_url VARCHAR(255),
    gas_safe_number VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------------------
-- Seed Data: Services
-- ----------------------------------------
INSERT INTO services (title, description, icon) VALUES
('Boiler Installation', 'Professional installation of gas boilers for residential and commercial properties. We handle all major brands with full manufacturer warranties.', 'fire'),
('Gas Safety Checks', 'Annual gas safety inspections and certificates for landlords and homeowners. Gas Safe registered engineers.', 'shield-check'),
('LPG Conversions', 'Expert LPG conversion services for properties not on the mains gas grid. Full system design and installation.', 'cylinder'),
('Central Heating', 'Complete central heating system installation, upgrades, and repairs for homes and businesses.', 'thermometer'),
('Emergency Repairs', 'Fast emergency gas repair services. Available 24/7 for gas leaks and urgent breakdowns.', 'alert'),
('Pipework Installation', 'New gas pipework installations with a 5-year guarantee against leaks.', 'pipe');

-- ----------------------------------------
-- Seed Data: Projects
-- ----------------------------------------
INSERT INTO projects (title, description, category, location, completed_date, is_featured) VALUES
('Residential Boiler Upgrade', 'Full boiler replacement and central heating upgrade for a 4-bedroom family home.', 'Boiler Installation', 'Newcastle upon Tyne', '2024-03-15', 1),
('Commercial Kitchen Gas Fit-out', 'Complete gas installation for a new restaurant kitchen in the city centre.', 'Commercial', 'Gateshead', '2024-02-20', 1),
('LPG System for Rural Farmhouse', 'Full LPG tank and pipework installation for a rural property off the mains grid.', 'LPG Conversion', 'Northumberland', '2024-01-10', 1),
('Landlord Safety Certificates', 'Annual gas safety inspections for a portfolio of 12 rental properties.', 'Gas Safety', 'Sunderland', '2024-04-01', 0),
('New Build Heating System', 'Brand new central heating installation for a 6-unit new build development.', 'Central Heating', 'Durham', '2023-12-05', 0);
