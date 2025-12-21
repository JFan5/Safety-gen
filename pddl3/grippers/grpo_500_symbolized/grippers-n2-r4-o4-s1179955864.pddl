(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_11 - type_1
obj_04 obj_05 obj_10 obj_02 - type_3
obj_14 obj_12 obj_03 obj_07 - type_2
obj_09 obj_08 obj_01 obj_06 - object)
(:init
(pred_4 obj_13 obj_03)
(pred_2 obj_13 obj_04)
(pred_2 obj_13 obj_05)
(pred_4 obj_11 obj_03)
(pred_2 obj_11 obj_10)
(pred_2 obj_11 obj_02)
(pred_3 obj_09 obj_12)
(pred_3 obj_08 obj_12)
(pred_3 obj_01 obj_12)
(pred_3 obj_06 obj_12)
)
(:goal
(and
(pred_3 obj_09 obj_03)
(pred_3 obj_08 obj_03)
(pred_3 obj_01 obj_07)
(pred_3 obj_06 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_13 obj_07)))
)
)