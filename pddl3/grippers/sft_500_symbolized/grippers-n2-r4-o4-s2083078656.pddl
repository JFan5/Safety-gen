(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_08 - type_3
obj_05 obj_01 obj_14 obj_10 - type_2
obj_02 obj_04 obj_13 obj_03 - type_1
obj_12 obj_07 obj_06 obj_09 - object)
(:init
(pred_1 obj_11 obj_03)
(pred_3 obj_11 obj_05)
(pred_3 obj_11 obj_01)
(pred_1 obj_08 obj_04)
(pred_3 obj_08 obj_14)
(pred_3 obj_08 obj_10)
(pred_2 obj_12 obj_04)
(pred_2 obj_07 obj_03)
(pred_2 obj_06 obj_13)
(pred_2 obj_09 obj_02)
)
(:goal
(and
(pred_2 obj_12 obj_04)
(pred_2 obj_07 obj_13)
(pred_2 obj_06 obj_03)
(pred_2 obj_09 obj_04)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_13)))
)
)