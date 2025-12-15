(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_07 - type_2
obj_09 obj_02 obj_12 obj_11 - type_3
obj_08 obj_04 obj_10 obj_05 - type_1
obj_06 obj_13 obj_14 obj_03 - object)
(:init
(pred_1 obj_01 obj_04)
(pred_3 obj_01 obj_09)
(pred_3 obj_01 obj_02)
(pred_1 obj_07 obj_04)
(pred_3 obj_07 obj_12)
(pred_3 obj_07 obj_11)
(pred_2 obj_06 obj_04)
(pred_2 obj_13 obj_05)
(pred_2 obj_14 obj_04)
(pred_2 obj_03 obj_10)
)
(:goal
(and
(pred_2 obj_06 obj_10)
(pred_2 obj_13 obj_10)
(pred_2 obj_14 obj_04)
(pred_2 obj_03 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_01 obj_10)))
)
)