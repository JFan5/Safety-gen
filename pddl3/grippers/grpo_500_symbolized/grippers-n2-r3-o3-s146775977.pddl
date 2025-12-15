(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_02 - type_1
obj_01 obj_11 obj_10 obj_06 - type_3
obj_07 obj_09 obj_05 - type_2
obj_08 obj_12 obj_03 - object)
(:init
(pred_3 obj_04 obj_07)
(pred_4 obj_04 obj_01)
(pred_4 obj_04 obj_11)
(pred_3 obj_02 obj_07)
(pred_4 obj_02 obj_10)
(pred_4 obj_02 obj_06)
(pred_2 obj_08 obj_07)
(pred_2 obj_12 obj_05)
(pred_2 obj_03 obj_09)
)
(:goal
(and
(pred_2 obj_08 obj_05)
(pred_2 obj_12 obj_07)
(pred_2 obj_03 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_05)))
)
)