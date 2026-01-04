(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_09 - type_1
obj_01 obj_11 obj_02 obj_12 - type_2
obj_06 obj_03 obj_05 - type_3
obj_04 obj_10 obj_07 - object)
(:init
(pred_1 obj_08 obj_05)
(pred_4 obj_08 obj_01)
(pred_4 obj_08 obj_11)
(pred_1 obj_09 obj_03)
(pred_4 obj_09 obj_02)
(pred_4 obj_09 obj_12)
(pred_3 obj_04 obj_05)
(pred_3 obj_10 obj_05)
(pred_3 obj_07 obj_05)
)
(:goal
(and
(pred_3 obj_04 obj_06)
(pred_3 obj_10 obj_05)
(pred_3 obj_07 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_06)))
)
)