(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_01 - type_1
obj_09 obj_10 obj_05 obj_07 - type_2
obj_04 obj_13 obj_06 obj_08 - type_3
obj_02 obj_11 obj_03 obj_12 - object)
(:init
(pred_1 obj_14 obj_06)
(pred_3 obj_14 obj_09)
(pred_3 obj_14 obj_10)
(pred_1 obj_01 obj_13)
(pred_3 obj_01 obj_05)
(pred_3 obj_01 obj_07)
(pred_2 obj_02 obj_08)
(pred_2 obj_11 obj_04)
(pred_2 obj_03 obj_06)
(pred_2 obj_12 obj_08)
)
(:goal
(and
(pred_2 obj_02 obj_04)
(pred_2 obj_11 obj_06)
(pred_2 obj_03 obj_06)
(pred_2 obj_12 obj_06)
)
)

(:constraints
  (always (not (pred_1 obj_14 obj_08)))
)
)