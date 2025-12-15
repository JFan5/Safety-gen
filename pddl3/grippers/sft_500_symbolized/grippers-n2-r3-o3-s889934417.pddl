(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_02 - type_2
obj_06 obj_12 obj_08 obj_09 - type_1
obj_04 obj_10 obj_05 - type_3
obj_07 obj_03 obj_11 - object)
(:init
(pred_4 obj_01 obj_04)
(pred_2 obj_01 obj_06)
(pred_2 obj_01 obj_12)
(pred_4 obj_02 obj_10)
(pred_2 obj_02 obj_08)
(pred_2 obj_02 obj_09)
(pred_3 obj_07 obj_10)
(pred_3 obj_03 obj_05)
(pred_3 obj_11 obj_05)
)
(:goal
(and
(pred_3 obj_07 obj_05)
(pred_3 obj_03 obj_05)
(pred_3 obj_11 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_05)))
)
)