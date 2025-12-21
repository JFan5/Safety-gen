(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_06 - type_1
obj_14 obj_01 obj_05 obj_02 - type_3
obj_09 obj_03 obj_10 obj_07 - type_2
obj_08 obj_13 obj_12 obj_11 - object)
(:init
(pred_4 obj_04 obj_10)
(pred_2 obj_04 obj_14)
(pred_2 obj_04 obj_01)
(pred_4 obj_06 obj_03)
(pred_2 obj_06 obj_05)
(pred_2 obj_06 obj_02)
(pred_3 obj_08 obj_07)
(pred_3 obj_13 obj_09)
(pred_3 obj_12 obj_10)
(pred_3 obj_11 obj_07)
)
(:goal
(and
(pred_3 obj_08 obj_09)
(pred_3 obj_13 obj_10)
(pred_3 obj_12 obj_10)
(pred_3 obj_11 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_07)))
)
)