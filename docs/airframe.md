# Airframe

## Rotor Position
Parameters:
- L: the length of the rotor arms
- α: the half-angle between rotors 1 and 2 (or equally rotors 3 and 4)
- β: the angle of elevation of the arms (wrt the horizontal)

Positions in body frame:
- r1: [ Lcosβcosα;-Lcosβsinα; -Lsinβ]
- r2: [ Lcosβcosα; Lcosβsinα; -Lsinβ]
- r3: [-Lcosβcosα; Lcosβsinα; -Lsinβ]
- r4: [-Lcosβcosα;-Lcosβsinα; -Lsinβ]

Recall z_b points down
β = 0 puts all rotors in the z_b = 0 plane

## Rotor Orientation and Numbering
From above

1  x_b  2
 \  |  /
  \ | /
    X---y_b
  /   \
 /     \
4       3 

- 1: CW
- 2: CCW
- 3: CW
- 4: CCW

## Rotor Reaction Torque
About z_b
- 1: -
- 2: +
- 3: -
- 4: +

Reaction torque is opposite of rotor spin per Newtons Third Law