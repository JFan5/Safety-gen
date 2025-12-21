(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_05 - type_1
obj_12 obj_11 obj_10 obj_14 - type_2
obj_03 obj_04 obj_09 obj_07 - type_3
obj_08 obj_06 obj_01 obj_02 - object)
(:init
(pred_1 obj_13 obj_07)
(pred_3 obj_13 obj_12)
(pred_3 obj_13 obj_11)
(pred_1 obj_05 obj_04)
(pred_3 obj_05 obj_10)
(pred_3 obj_05 obj_14)
(pred_2 obj_08 obj_03)
(pred_2 obj_06 obj_09)
(pred_2 obj_01 obj_04)
(pred_2 obj_02 obj_09)
)
(:goal
(and
(pred_2 obj_08 obj_07)
(pred_2 obj_06 obj_04)
(pred_2 obj_01 obj_03)
(pred_2 obj_02 obj_04)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_09)))
)
)