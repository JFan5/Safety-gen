(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_13 - type_1
obj_12 obj_03 obj_06 obj_04 - type_3
obj_09 obj_02 obj_10 obj_11 - type_2
obj_05 obj_08 obj_07 obj_14 - object)
(:init
(pred_3 obj_01 obj_11)
(pred_4 obj_01 obj_12)
(pred_4 obj_01 obj_03)
(pred_3 obj_13 obj_11)
(pred_4 obj_13 obj_06)
(pred_4 obj_13 obj_04)
(pred_2 obj_05 obj_09)
(pred_2 obj_08 obj_10)
(pred_2 obj_07 obj_09)
(pred_2 obj_14 obj_10)
)
(:goal
(and
(pred_2 obj_05 obj_10)
(pred_2 obj_08 obj_09)
(pred_2 obj_07 obj_10)
(pred_2 obj_14 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_10)))
)
)