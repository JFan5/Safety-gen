(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_05 - type_3
obj_14 obj_04 obj_01 obj_09 - type_2
obj_02 obj_12 obj_06 obj_07 - type_1
obj_10 obj_03 obj_11 obj_08 - object)
(:init
(pred_2 obj_13 obj_07)
(pred_1 obj_13 obj_14)
(pred_1 obj_13 obj_04)
(pred_2 obj_05 obj_07)
(pred_1 obj_05 obj_01)
(pred_1 obj_05 obj_09)
(pred_4 obj_10 obj_02)
(pred_4 obj_03 obj_06)
(pred_4 obj_11 obj_06)
(pred_4 obj_08 obj_02)
)
(:goal
(and
(pred_4 obj_10 obj_02)
(pred_4 obj_03 obj_02)
(pred_4 obj_11 obj_12)
(pred_4 obj_08 obj_07)
)
)

(:constraints
  (always (not (pred_2 obj_13 obj_06)))
)
)