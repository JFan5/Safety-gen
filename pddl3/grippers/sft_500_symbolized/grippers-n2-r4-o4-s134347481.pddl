(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_12 - type_1
obj_03 obj_04 obj_02 obj_08 - type_2
obj_09 obj_01 obj_13 obj_05 - type_3
obj_14 obj_11 obj_06 obj_07 - object)
(:init
(pred_1 obj_10 obj_05)
(pred_3 obj_10 obj_03)
(pred_3 obj_10 obj_04)
(pred_1 obj_12 obj_13)
(pred_3 obj_12 obj_02)
(pred_3 obj_12 obj_08)
(pred_2 obj_14 obj_13)
(pred_2 obj_11 obj_13)
(pred_2 obj_06 obj_05)
(pred_2 obj_07 obj_01)
)
(:goal
(and
(pred_2 obj_14 obj_05)
(pred_2 obj_11 obj_05)
(pred_2 obj_06 obj_01)
(pred_2 obj_07 obj_13)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_13)))
)
)