(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_04 - type_1
obj_12 obj_14 obj_11 obj_09 - type_3
obj_07 obj_05 obj_03 obj_10 - type_2
obj_02 obj_01 obj_13 obj_08 - object)
(:init
(pred_4 obj_06 obj_05)
(pred_2 obj_06 obj_12)
(pred_2 obj_06 obj_14)
(pred_4 obj_04 obj_03)
(pred_2 obj_04 obj_11)
(pred_2 obj_04 obj_09)
(pred_3 obj_02 obj_03)
(pred_3 obj_01 obj_05)
(pred_3 obj_13 obj_03)
(pred_3 obj_08 obj_07)
)
(:goal
(and
(pred_3 obj_02 obj_07)
(pred_3 obj_01 obj_03)
(pred_3 obj_13 obj_05)
(pred_3 obj_08 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_03)))
)
)