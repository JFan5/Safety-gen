(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_11 - type_1
obj_07 obj_12 obj_09 obj_03 - type_3
obj_05 obj_06 obj_02 - type_2
obj_10 obj_04 obj_01 - object)
(:init
(pred_4 obj_08 obj_02)
(pred_2 obj_08 obj_07)
(pred_2 obj_08 obj_12)
(pred_4 obj_11 obj_05)
(pred_2 obj_11 obj_09)
(pred_2 obj_11 obj_03)
(pred_3 obj_10 obj_02)
(pred_3 obj_04 obj_05)
(pred_3 obj_01 obj_02)
)
(:goal
(and
(pred_3 obj_10 obj_06)
(pred_3 obj_04 obj_05)
(pred_3 obj_01 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_06)))
)
)