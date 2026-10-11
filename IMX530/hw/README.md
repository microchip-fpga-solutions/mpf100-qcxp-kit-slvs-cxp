# IMX530 Design Flow

## Directory Structure

The `IMX530` directory is organized as follows:

```
IMX530
├── hw
│   └── src
│   │   ├── cfg
│   │   ├── components
│   │   ├── constraints
│   │   ├── hdl
│   │   ├── softconsole
│   │   ├── 1_create_design.tcl
│   │   ├── 2_constrain_design.tcl
│   │   ├── 4_implement_design.tcl
│   │   ├── 5_program_design.tcl
│   ├── common
│   │   └── common.tcl
│   ├── script.tcl
│   └── README.md
└── fw
```

## Folder Descriptions

### Firmware Folder

**`IMX530\fw`**

Contains the SoftConsole project to run the design.

> **Note:** Remove the `.hex` file from the design when you want to run SoftConsole in Debug Mode.

### Hardware Source Folder

**`IMX530\hw\src`** contains the following subfolders:

| Folder | Description |
|--------|-------------|
| `cfg` | Contains RAM, SNVM, and SPI flash configuration files |
| `components` | Contains core configuration TCLs required to create the design |
| `constraints` | Contains IO, user timing, and floor planning constraints |
| `hdl` | Contains HDL files (if applicable) |
| `softconsole` | Contains the hex file for the particular application |

## TCL Files

**`IMX530\hw\src`** includes the following TCL files:

| TCL File | Description |
|----------|-------------|
| `1_create_design.tcl` | Executes all required core configuration TCLs with necessary user HDL files from src folder to create the design |
| `2_constraints.tcl` | Imports all constraints required for the design |
| `4_implement_design.tcl` | Runs synthesis, place & route, and verify timing |
| `5_program_design.tcl` | Creates the programming job file |
| `common.tcl` | Provides all IP core versions, tool profiles, and device information required to implement the design |
| `script.tcl` | Top-level script that creates the Libero_Project directory, sets device, project name, and other tool profiles. Invokes all above TCLs required to complete the Libero design flow |

## Running the TCL Scripts

The TCL scripts are validated for **Libero v2026.1** and IP versions as specified in `common.tcl`.

### Steps to Run

1. Launch the Libero software
2. Select **Project > Execute Script...**
3. Click **Browse** and select `script.tcl` from the downloaded TCL_Scripts directory
4. Click **Run**

After successful execution of the TCL script, the Libero project is created within the TCL_Scripts directory.

## Updating TCL for New Libero and IP Versions

Update the IP core versions in `common.tcl` and run the TCL flow in the new Libero version. By default, the given TCL script should run for new Libero and IP releases.

### Troubleshooting

If there are any mismatches in execution, check the following:

1. **For Libero related errors:**
   - Check Libero release notes for changes related to the design components/tools or changes to TCL commands

2. **For IP core related errors:**
   - Check the IP handbook and release notes for changes in IP configuration parameters, ports, and their functionality
   - If necessary, update the IP configuration parameters, ports, and connections in the TCL

## References

- Refer to **Libero® SoC TCL Command Reference Guide** for more details on TCL commands
- Contact **Techsupport** if you run into any TCL related queries
- List of Frame Grabber Software versions
   - Sapera-LT-SDK-8.73 
   - Xtium2-CXP_PX8_1.10.01.0113 drivers
   - egrabber v23.02.0.70
   - MVS v4.4.13
   - ActiveCapture v1.6.12
   - bopixel v1.1.4.15
   - IKapLibrary 1.2.8  
