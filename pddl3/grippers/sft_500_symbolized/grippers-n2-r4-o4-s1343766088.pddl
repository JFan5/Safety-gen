(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_04 - type_3
obj_13 obj_09 obj_02 obj_05 - type_2
obj_03 obj_06 obj_14 obj_07 - type_1
obj_01 obj_12 obj_10 obj_11 - object)
(:init
(pred_2 obj_08 obj_14)
(pred_3 obj_08 obj_13)
(pred_3 obj_08 obj_09)
(pred_2 obj_04 obj_06)
(pred_3 obj_04 obj_02)
(pred_3 obj_04 obj_05)
(pred_4 obj_01 obj_06)
(pred_4 obj_12 obj_06)
(pred_4 obj_10 obj_14)
(pred_4 obj_11 obj_03)
)
(:goal
(and
(pred_4 obj_01 obj_03)
(pred_4 obj_12 obj_14)
(pred_4 obj_10 obj_07)
(pred_4 obj_11 obj_14)
)
)

(:constraints
  (always (not (pred_2 obj_08 obj_07)))
)
)