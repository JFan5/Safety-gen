(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_04 - type_1
obj_12 obj_05 obj_02 obj_08 - type_2
obj_07 obj_10 obj_06 - type_3
obj_09 obj_01 obj_11 - object)
(:init
(pred_1 obj_03 obj_07)
(pred_3 obj_03 obj_12)
(pred_3 obj_03 obj_05)
(pred_1 obj_04 obj_07)
(pred_3 obj_04 obj_02)
(pred_3 obj_04 obj_08)
(pred_2 obj_09 obj_07)
(pred_2 obj_01 obj_10)
(pred_2 obj_11 obj_06)
)
(:goal
(and
(pred_2 obj_09 obj_07)
(pred_2 obj_01 obj_07)
(pred_2 obj_11 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_03 obj_06)))
)
)