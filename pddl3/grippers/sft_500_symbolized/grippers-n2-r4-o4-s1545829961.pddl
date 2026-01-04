(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_07 - type_2
obj_06 obj_09 obj_14 obj_11 - type_3
obj_03 obj_05 obj_13 obj_10 - type_1
obj_02 obj_01 obj_08 obj_12 - object)
(:init
(pred_4 obj_04 obj_03)
(pred_1 obj_04 obj_06)
(pred_1 obj_04 obj_09)
(pred_4 obj_07 obj_03)
(pred_1 obj_07 obj_14)
(pred_1 obj_07 obj_11)
(pred_2 obj_02 obj_13)
(pred_2 obj_01 obj_03)
(pred_2 obj_08 obj_13)
(pred_2 obj_12 obj_05)
)
(:goal
(and
(pred_2 obj_02 obj_13)
(pred_2 obj_01 obj_03)
(pred_2 obj_08 obj_05)
(pred_2 obj_12 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_13)))
)
)