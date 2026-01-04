(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_09 - type_3
obj_05 obj_13 obj_11 obj_07 - type_2
obj_02 obj_10 obj_06 obj_04 - type_1
obj_12 obj_03 obj_01 - object)
(:init
(pred_4 obj_08 obj_04)
(pred_1 obj_08 obj_05)
(pred_1 obj_08 obj_13)
(pred_4 obj_09 obj_02)
(pred_1 obj_09 obj_11)
(pred_1 obj_09 obj_07)
(pred_3 obj_12 obj_06)
(pred_3 obj_03 obj_04)
(pred_3 obj_01 obj_02)
)
(:goal
(and
(pred_3 obj_12 obj_06)
(pred_3 obj_03 obj_06)
(pred_3 obj_01 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_06)))
)
)