(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_10 - type_2
obj_14 obj_11 obj_07 obj_12 - type_1
obj_09 obj_13 obj_05 obj_03 - type_3
obj_08 obj_01 obj_02 obj_04 - object)
(:init
(pred_1 obj_06 obj_09)
(pred_4 obj_06 obj_14)
(pred_4 obj_06 obj_11)
(pred_1 obj_10 obj_09)
(pred_4 obj_10 obj_07)
(pred_4 obj_10 obj_12)
(pred_2 obj_08 obj_03)
(pred_2 obj_01 obj_09)
(pred_2 obj_02 obj_03)
(pred_2 obj_04 obj_13)
)
(:goal
(and
(pred_2 obj_08 obj_05)
(pred_2 obj_01 obj_03)
(pred_2 obj_02 obj_13)
(pred_2 obj_04 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_05)))
)
)