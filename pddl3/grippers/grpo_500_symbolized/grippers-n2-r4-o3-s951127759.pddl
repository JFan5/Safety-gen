(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_01 - type_1
obj_11 obj_04 obj_05 obj_07 - type_3
obj_09 obj_02 obj_06 obj_10 - type_2
obj_08 obj_12 obj_03 - object)
(:init
(pred_3 obj_13 obj_10)
(pred_4 obj_13 obj_11)
(pred_4 obj_13 obj_04)
(pred_3 obj_01 obj_10)
(pred_4 obj_01 obj_05)
(pred_4 obj_01 obj_07)
(pred_2 obj_08 obj_06)
(pred_2 obj_12 obj_02)
(pred_2 obj_03 obj_02)
)
(:goal
(and
(pred_2 obj_08 obj_02)
(pred_2 obj_12 obj_02)
(pred_2 obj_03 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_06)))
)
)