(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_05 - type_1
obj_01 obj_04 obj_08 obj_09 - type_3
obj_07 obj_11 obj_12 obj_03 - type_2
obj_10 obj_02 obj_13 - object)
(:init
(pred_4 obj_06 obj_11)
(pred_2 obj_06 obj_01)
(pred_2 obj_06 obj_04)
(pred_4 obj_05 obj_11)
(pred_2 obj_05 obj_08)
(pred_2 obj_05 obj_09)
(pred_3 obj_10 obj_12)
(pred_3 obj_02 obj_11)
(pred_3 obj_13 obj_03)
)
(:goal
(and
(pred_3 obj_10 obj_11)
(pred_3 obj_02 obj_12)
(pred_3 obj_13 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_12)))
)
)