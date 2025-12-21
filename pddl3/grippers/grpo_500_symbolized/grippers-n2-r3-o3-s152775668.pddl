(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_06 - type_1
obj_02 obj_09 obj_03 obj_12 - type_3
obj_01 obj_05 obj_11 - type_2
obj_10 obj_04 obj_07 - object)
(:init
(pred_4 obj_08 obj_01)
(pred_2 obj_08 obj_02)
(pred_2 obj_08 obj_09)
(pred_4 obj_06 obj_11)
(pred_2 obj_06 obj_03)
(pred_2 obj_06 obj_12)
(pred_3 obj_10 obj_11)
(pred_3 obj_04 obj_11)
(pred_3 obj_07 obj_01)
)
(:goal
(and
(pred_3 obj_10 obj_05)
(pred_3 obj_04 obj_01)
(pred_3 obj_07 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_11)))
)
)