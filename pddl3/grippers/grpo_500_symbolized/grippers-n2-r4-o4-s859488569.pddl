(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_04 - type_1
obj_10 obj_11 obj_12 obj_07 - type_3
obj_08 obj_05 obj_14 obj_09 - type_2
obj_06 obj_01 obj_02 obj_13 - object)
(:init
(pred_3 obj_03 obj_09)
(pred_4 obj_03 obj_10)
(pred_4 obj_03 obj_11)
(pred_3 obj_04 obj_09)
(pred_4 obj_04 obj_12)
(pred_4 obj_04 obj_07)
(pred_2 obj_06 obj_05)
(pred_2 obj_01 obj_09)
(pred_2 obj_02 obj_08)
(pred_2 obj_13 obj_14)
)
(:goal
(and
(pred_2 obj_06 obj_14)
(pred_2 obj_01 obj_05)
(pred_2 obj_02 obj_08)
(pred_2 obj_13 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_14)))
)
)