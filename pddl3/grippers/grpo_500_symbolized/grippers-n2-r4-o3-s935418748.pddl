(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_11 - type_1
obj_05 obj_02 obj_12 obj_07 - type_3
obj_06 obj_04 obj_13 obj_08 - type_2
obj_03 obj_09 obj_10 - object)
(:init
(pred_4 obj_01 obj_13)
(pred_2 obj_01 obj_05)
(pred_2 obj_01 obj_02)
(pred_4 obj_11 obj_04)
(pred_2 obj_11 obj_12)
(pred_2 obj_11 obj_07)
(pred_3 obj_03 obj_13)
(pred_3 obj_09 obj_08)
(pred_3 obj_10 obj_13)
)
(:goal
(and
(pred_3 obj_03 obj_13)
(pred_3 obj_09 obj_13)
(pred_3 obj_10 obj_08)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_08)))
)
)