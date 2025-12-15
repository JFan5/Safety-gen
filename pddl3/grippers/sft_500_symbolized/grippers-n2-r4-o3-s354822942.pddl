(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_03 - type_2
obj_02 obj_04 obj_05 obj_07 - type_3
obj_12 obj_08 obj_06 obj_11 - type_1
obj_13 obj_10 obj_01 - object)
(:init
(pred_2 obj_09 obj_12)
(pred_4 obj_09 obj_02)
(pred_4 obj_09 obj_04)
(pred_2 obj_03 obj_12)
(pred_4 obj_03 obj_05)
(pred_4 obj_03 obj_07)
(pred_1 obj_13 obj_06)
(pred_1 obj_10 obj_11)
(pred_1 obj_01 obj_08)
)
(:goal
(and
(pred_1 obj_13 obj_08)
(pred_1 obj_10 obj_06)
(pred_1 obj_01 obj_06)
)
)

(:constraints
  (always (not (pred_2 obj_09 obj_06)))
)
)