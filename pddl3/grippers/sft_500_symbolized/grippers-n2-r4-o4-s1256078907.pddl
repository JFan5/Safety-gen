(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_06 - type_1
obj_08 obj_03 obj_10 obj_04 - type_2
obj_09 obj_12 obj_13 obj_05 - type_3
obj_07 obj_11 obj_02 obj_14 - object)
(:init
(pred_1 obj_01 obj_12)
(pred_3 obj_01 obj_08)
(pred_3 obj_01 obj_03)
(pred_1 obj_06 obj_09)
(pred_3 obj_06 obj_10)
(pred_3 obj_06 obj_04)
(pred_2 obj_07 obj_09)
(pred_2 obj_11 obj_05)
(pred_2 obj_02 obj_13)
(pred_2 obj_14 obj_09)
)
(:goal
(and
(pred_2 obj_07 obj_12)
(pred_2 obj_11 obj_09)
(pred_2 obj_02 obj_12)
(pred_2 obj_14 obj_12)
)
)

(:constraints
  (always (not (pred_1 obj_01 obj_13)))
)
)