(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_03 - type_2
obj_13 obj_11 obj_07 obj_14 - type_1
obj_05 obj_10 obj_08 obj_09 - type_3
obj_12 obj_01 obj_04 obj_02 - object)
(:init
(pred_3 obj_06 obj_10)
(pred_4 obj_06 obj_13)
(pred_4 obj_06 obj_11)
(pred_3 obj_03 obj_09)
(pred_4 obj_03 obj_07)
(pred_4 obj_03 obj_14)
(pred_1 obj_12 obj_09)
(pred_1 obj_01 obj_05)
(pred_1 obj_04 obj_09)
(pred_1 obj_02 obj_09)
)
(:goal
(and
(pred_1 obj_12 obj_08)
(pred_1 obj_01 obj_09)
(pred_1 obj_04 obj_10)
(pred_1 obj_02 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_08)))
)
)