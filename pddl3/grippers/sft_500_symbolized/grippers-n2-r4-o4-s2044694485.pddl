(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_01 - type_3
obj_09 obj_03 obj_12 obj_05 - type_2
obj_02 obj_07 obj_11 obj_14 - type_1
obj_08 obj_04 obj_13 obj_06 - object)
(:init
(pred_3 obj_10 obj_11)
(pred_2 obj_10 obj_09)
(pred_2 obj_10 obj_03)
(pred_3 obj_01 obj_11)
(pred_2 obj_01 obj_12)
(pred_2 obj_01 obj_05)
(pred_4 obj_08 obj_11)
(pred_4 obj_04 obj_02)
(pred_4 obj_13 obj_14)
(pred_4 obj_06 obj_02)
)
(:goal
(and
(pred_4 obj_08 obj_07)
(pred_4 obj_04 obj_14)
(pred_4 obj_13 obj_02)
(pred_4 obj_06 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_14)))
)
)