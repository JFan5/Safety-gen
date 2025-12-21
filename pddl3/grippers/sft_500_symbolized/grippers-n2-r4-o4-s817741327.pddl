(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_05 - type_1
obj_03 obj_07 obj_08 obj_02 - type_2
obj_09 obj_06 obj_10 obj_11 - type_3
obj_01 obj_12 obj_14 obj_04 - object)
(:init
(pred_1 obj_13 obj_06)
(pred_3 obj_13 obj_03)
(pred_3 obj_13 obj_07)
(pred_1 obj_05 obj_10)
(pred_3 obj_05 obj_08)
(pred_3 obj_05 obj_02)
(pred_2 obj_01 obj_11)
(pred_2 obj_12 obj_06)
(pred_2 obj_14 obj_09)
(pred_2 obj_04 obj_09)
)
(:goal
(and
(pred_2 obj_01 obj_10)
(pred_2 obj_12 obj_10)
(pred_2 obj_14 obj_06)
(pred_2 obj_04 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_10)))
)
)