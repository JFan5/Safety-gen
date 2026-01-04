(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_13 - type_2
obj_05 obj_04 obj_07 obj_01 - type_3
obj_06 obj_03 obj_11 obj_09 - type_1
obj_10 obj_02 obj_12 obj_14 - object)
(:init
(pred_2 obj_08 obj_11)
(pred_3 obj_08 obj_05)
(pred_3 obj_08 obj_04)
(pred_2 obj_13 obj_11)
(pred_3 obj_13 obj_07)
(pred_3 obj_13 obj_01)
(pred_4 obj_10 obj_03)
(pred_4 obj_02 obj_11)
(pred_4 obj_12 obj_09)
(pred_4 obj_14 obj_11)
)
(:goal
(and
(pred_4 obj_10 obj_11)
(pred_4 obj_02 obj_11)
(pred_4 obj_12 obj_09)
(pred_4 obj_14 obj_09)
)
)

(:constraints
  (always (not (pred_2 obj_08 obj_09)))
)
)