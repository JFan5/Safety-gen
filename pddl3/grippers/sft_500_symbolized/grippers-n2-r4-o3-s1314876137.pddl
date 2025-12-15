(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_13 - type_3
obj_12 obj_04 obj_07 obj_08 - type_1
obj_03 obj_05 obj_10 obj_02 - type_2
obj_06 obj_11 obj_09 - object)
(:init
(pred_4 obj_01 obj_10)
(pred_3 obj_01 obj_12)
(pred_3 obj_01 obj_04)
(pred_4 obj_13 obj_05)
(pred_3 obj_13 obj_07)
(pred_3 obj_13 obj_08)
(pred_2 obj_06 obj_10)
(pred_2 obj_11 obj_05)
(pred_2 obj_09 obj_05)
)
(:goal
(and
(pred_2 obj_06 obj_02)
(pred_2 obj_11 obj_02)
(pred_2 obj_09 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_02)))
)
)