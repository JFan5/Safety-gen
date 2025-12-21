(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_01 - type_1
obj_05 obj_09 obj_03 obj_10 - type_2
obj_13 obj_08 obj_04 obj_14 - type_3
obj_11 obj_12 obj_07 obj_02 - object)
(:init
(pred_1 obj_06 obj_14)
(pred_3 obj_06 obj_05)
(pred_3 obj_06 obj_09)
(pred_1 obj_01 obj_13)
(pred_3 obj_01 obj_03)
(pred_3 obj_01 obj_10)
(pred_2 obj_11 obj_14)
(pred_2 obj_12 obj_13)
(pred_2 obj_07 obj_14)
(pred_2 obj_02 obj_08)
)
(:goal
(and
(pred_2 obj_11 obj_04)
(pred_2 obj_12 obj_04)
(pred_2 obj_07 obj_14)
(pred_2 obj_02 obj_14)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_04)))
)
)