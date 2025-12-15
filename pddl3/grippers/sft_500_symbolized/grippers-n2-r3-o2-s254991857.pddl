(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_03 obj_04 - type_3
obj_01 obj_11 obj_05 obj_07 - type_1
obj_09 obj_02 obj_06 - type_2
obj_10 obj_08 - object)
(:init
(pred_1 obj_03 obj_02)
(pred_4 obj_03 obj_01)
(pred_4 obj_03 obj_11)
(pred_1 obj_04 obj_02)
(pred_4 obj_04 obj_05)
(pred_4 obj_04 obj_07)
(pred_2 obj_10 obj_09)
(pred_2 obj_08 obj_06)
)
(:goal
(and
(pred_2 obj_10 obj_02)
(pred_2 obj_08 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_03 obj_06)))
)
)