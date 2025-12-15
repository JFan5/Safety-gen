(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_12 - type_1
obj_06 obj_08 obj_11 obj_01 - type_3
obj_04 obj_02 obj_05 - type_2
obj_03 obj_09 obj_10 - object)
(:init
(pred_3 obj_07 obj_04)
(pred_4 obj_07 obj_06)
(pred_4 obj_07 obj_08)
(pred_3 obj_12 obj_05)
(pred_4 obj_12 obj_11)
(pred_4 obj_12 obj_01)
(pred_2 obj_03 obj_02)
(pred_2 obj_09 obj_04)
(pred_2 obj_10 obj_02)
)
(:goal
(and
(pred_2 obj_03 obj_05)
(pred_2 obj_09 obj_04)
(pred_2 obj_10 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_05)))
)
)