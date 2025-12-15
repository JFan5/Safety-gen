(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_04 obj_10 - type_1
obj_01 obj_11 obj_08 obj_03 - type_3
obj_09 obj_05 obj_02 - type_2
obj_06 obj_07 - object)
(:init
(pred_3 obj_04 obj_09)
(pred_4 obj_04 obj_01)
(pred_4 obj_04 obj_11)
(pred_3 obj_10 obj_02)
(pred_4 obj_10 obj_08)
(pred_4 obj_10 obj_03)
(pred_2 obj_06 obj_02)
(pred_2 obj_07 obj_09)
)
(:goal
(and
(pred_2 obj_06 obj_02)
(pred_2 obj_07 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_02)))
)
)