(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_05 obj_07 obj_10 obj_06 - type_3
obj_12 obj_02 obj_13 obj_14 - type_2
obj_11 obj_08 obj_03 obj_04 - object)
(:init
(pred_4 obj_09 obj_13)
(pred_2 obj_09 obj_05)
(pred_2 obj_09 obj_07)
(pred_4 obj_01 obj_02)
(pred_2 obj_01 obj_10)
(pred_2 obj_01 obj_06)
(pred_3 obj_11 obj_12)
(pred_3 obj_08 obj_14)
(pred_3 obj_03 obj_14)
(pred_3 obj_04 obj_14)
)
(:goal
(and
(pred_3 obj_11 obj_02)
(pred_3 obj_08 obj_12)
(pred_3 obj_03 obj_13)
(pred_3 obj_04 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_14)))
)
)