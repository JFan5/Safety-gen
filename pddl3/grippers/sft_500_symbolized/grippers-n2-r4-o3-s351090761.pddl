(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_02 - type_1
obj_05 obj_03 obj_08 obj_04 - type_2
obj_13 obj_06 obj_09 obj_10 - type_3
obj_11 obj_12 obj_07 - object)
(:init
(pred_4 obj_01 obj_09)
(pred_1 obj_01 obj_05)
(pred_1 obj_01 obj_03)
(pred_4 obj_02 obj_09)
(pred_1 obj_02 obj_08)
(pred_1 obj_02 obj_04)
(pred_2 obj_11 obj_13)
(pred_2 obj_12 obj_10)
(pred_2 obj_07 obj_10)
)
(:goal
(and
(pred_2 obj_11 obj_13)
(pred_2 obj_12 obj_09)
(pred_2 obj_07 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_10)))
)
)