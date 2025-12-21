(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_01 - type_1
obj_05 obj_09 obj_11 obj_04 - type_2
obj_12 obj_07 obj_03 obj_08 - type_3
obj_10 obj_13 obj_14 obj_02 - object)
(:init
(pred_1 obj_06 obj_03)
(pred_3 obj_06 obj_05)
(pred_3 obj_06 obj_09)
(pred_1 obj_01 obj_12)
(pred_3 obj_01 obj_11)
(pred_3 obj_01 obj_04)
(pred_2 obj_10 obj_03)
(pred_2 obj_13 obj_08)
(pred_2 obj_14 obj_07)
(pred_2 obj_02 obj_12)
)
(:goal
(and
(pred_2 obj_10 obj_07)
(pred_2 obj_13 obj_03)
(pred_2 obj_14 obj_03)
(pred_2 obj_02 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_08)))
)
)