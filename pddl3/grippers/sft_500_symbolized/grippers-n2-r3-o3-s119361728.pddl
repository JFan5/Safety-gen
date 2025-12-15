(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_12 - type_3
obj_10 obj_01 obj_08 obj_11 - type_2
obj_05 obj_02 obj_06 - type_1
obj_03 obj_09 obj_07 - object)
(:init
(pred_2 obj_04 obj_02)
(pred_4 obj_04 obj_10)
(pred_4 obj_04 obj_01)
(pred_2 obj_12 obj_02)
(pred_4 obj_12 obj_08)
(pred_4 obj_12 obj_11)
(pred_1 obj_03 obj_02)
(pred_1 obj_09 obj_02)
(pred_1 obj_07 obj_02)
)
(:goal
(and
(pred_1 obj_03 obj_02)
(pred_1 obj_09 obj_02)
(pred_1 obj_07 obj_06)
)
)

(:constraints
  (always (not (pred_2 obj_04 obj_06)))
)
)