(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_10 - type_1
obj_05 obj_12 obj_04 obj_03 - type_2
obj_07 obj_11 obj_09 - type_3
obj_08 obj_01 obj_06 - object)
(:init
(pred_1 obj_02 obj_11)
(pred_3 obj_02 obj_05)
(pred_3 obj_02 obj_12)
(pred_1 obj_10 obj_07)
(pred_3 obj_10 obj_04)
(pred_3 obj_10 obj_03)
(pred_2 obj_08 obj_11)
(pred_2 obj_01 obj_11)
(pred_2 obj_06 obj_11)
)
(:goal
(and
(pred_2 obj_08 obj_09)
(pred_2 obj_01 obj_09)
(pred_2 obj_06 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_09)))
)
)