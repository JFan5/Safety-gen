(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_04 - type_1
obj_07 obj_11 obj_14 obj_09 - type_2
obj_01 obj_12 obj_10 obj_13 - type_3
obj_03 obj_08 obj_02 obj_05 - object)
(:init
(pred_1 obj_06 obj_10)
(pred_3 obj_06 obj_07)
(pred_3 obj_06 obj_11)
(pred_1 obj_04 obj_10)
(pred_3 obj_04 obj_14)
(pred_3 obj_04 obj_09)
(pred_2 obj_03 obj_12)
(pred_2 obj_08 obj_10)
(pred_2 obj_02 obj_13)
(pred_2 obj_05 obj_10)
)
(:goal
(and
(pred_2 obj_03 obj_10)
(pred_2 obj_08 obj_10)
(pred_2 obj_02 obj_13)
(pred_2 obj_05 obj_13)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_13)))
)
)