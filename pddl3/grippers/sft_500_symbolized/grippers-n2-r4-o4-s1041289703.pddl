(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_04 - type_3
obj_11 obj_02 obj_03 obj_14 - type_1
obj_08 obj_09 obj_06 obj_07 - type_2
obj_13 obj_05 obj_10 obj_12 - object)
(:init
(pred_3 obj_01 obj_07)
(pred_4 obj_01 obj_11)
(pred_4 obj_01 obj_02)
(pred_3 obj_04 obj_08)
(pred_4 obj_04 obj_03)
(pred_4 obj_04 obj_14)
(pred_1 obj_13 obj_08)
(pred_1 obj_05 obj_06)
(pred_1 obj_10 obj_09)
(pred_1 obj_12 obj_09)
)
(:goal
(and
(pred_1 obj_13 obj_07)
(pred_1 obj_05 obj_08)
(pred_1 obj_10 obj_07)
(pred_1 obj_12 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_06)))
)
)