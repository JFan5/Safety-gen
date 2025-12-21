(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_10 - type_1
obj_01 obj_04 obj_08 obj_11 - type_3
obj_14 obj_03 obj_12 obj_09 - type_2
obj_13 obj_06 obj_05 obj_07 - object)
(:init
(pred_4 obj_02 obj_14)
(pred_2 obj_02 obj_01)
(pred_2 obj_02 obj_04)
(pred_4 obj_10 obj_14)
(pred_2 obj_10 obj_08)
(pred_2 obj_10 obj_11)
(pred_3 obj_13 obj_14)
(pred_3 obj_06 obj_09)
(pred_3 obj_05 obj_14)
(pred_3 obj_07 obj_03)
)
(:goal
(and
(pred_3 obj_13 obj_12)
(pred_3 obj_06 obj_09)
(pred_3 obj_05 obj_14)
(pred_3 obj_07 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_12)))
)
)