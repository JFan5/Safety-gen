(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_05 - type_1
obj_03 obj_11 obj_12 obj_01 - type_2
obj_06 obj_09 obj_02 - type_3
obj_04 obj_07 obj_08 - object)
(:init
(pred_1 obj_10 obj_06)
(pred_2 obj_10 obj_03)
(pred_2 obj_10 obj_11)
(pred_1 obj_05 obj_02)
(pred_2 obj_05 obj_12)
(pred_2 obj_05 obj_01)
(pred_4 obj_04 obj_09)
(pred_4 obj_07 obj_02)
(pred_4 obj_08 obj_02)
)
(:goal
(and
(pred_4 obj_04 obj_02)
(pred_4 obj_07 obj_09)
(pred_4 obj_08 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_02)))
)
)