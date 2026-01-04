(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_04 - type_1
obj_13 obj_07 obj_12 obj_01 - type_3
obj_02 obj_08 obj_05 obj_06 - type_2
obj_09 obj_10 obj_14 obj_03 - object)
(:init
(pred_2 obj_11 obj_05)
(pred_4 obj_11 obj_13)
(pred_4 obj_11 obj_07)
(pred_2 obj_04 obj_05)
(pred_4 obj_04 obj_12)
(pred_4 obj_04 obj_01)
(pred_3 obj_09 obj_02)
(pred_3 obj_10 obj_02)
(pred_3 obj_14 obj_02)
(pred_3 obj_03 obj_06)
)
(:goal
(and
(pred_3 obj_09 obj_02)
(pred_3 obj_10 obj_02)
(pred_3 obj_14 obj_05)
(pred_3 obj_03 obj_08)
)
)

(:constraints
  (always (not (pred_2 obj_11 obj_06)))
)
)