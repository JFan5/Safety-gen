(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_13 - type_1
obj_07 obj_08 obj_05 obj_12 - type_3
obj_04 obj_09 obj_14 obj_11 - type_2
obj_10 obj_03 obj_06 obj_01 - object)
(:init
(pred_3 obj_02 obj_14)
(pred_4 obj_02 obj_07)
(pred_4 obj_02 obj_08)
(pred_3 obj_13 obj_09)
(pred_4 obj_13 obj_05)
(pred_4 obj_13 obj_12)
(pred_2 obj_10 obj_11)
(pred_2 obj_03 obj_04)
(pred_2 obj_06 obj_09)
(pred_2 obj_01 obj_09)
)
(:goal
(and
(pred_2 obj_10 obj_14)
(pred_2 obj_03 obj_09)
(pred_2 obj_06 obj_04)
(pred_2 obj_01 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_11)))
)
)