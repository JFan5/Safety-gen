(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_11 - type_1
obj_05 obj_08 obj_07 obj_03 - type_3
obj_13 obj_04 obj_14 obj_02 - type_2
obj_01 obj_06 obj_12 obj_10 - object)
(:init
(pred_4 obj_09 obj_14)
(pred_2 obj_09 obj_05)
(pred_2 obj_09 obj_08)
(pred_4 obj_11 obj_14)
(pred_2 obj_11 obj_07)
(pred_2 obj_11 obj_03)
(pred_3 obj_01 obj_04)
(pred_3 obj_06 obj_04)
(pred_3 obj_12 obj_14)
(pred_3 obj_10 obj_02)
)
(:goal
(and
(pred_3 obj_01 obj_14)
(pred_3 obj_06 obj_04)
(pred_3 obj_12 obj_14)
(pred_3 obj_10 obj_04)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_02)))
)
)