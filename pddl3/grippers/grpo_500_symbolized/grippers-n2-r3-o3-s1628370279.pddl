(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_03 - type_1
obj_07 obj_12 obj_10 obj_11 - type_3
obj_01 obj_09 obj_05 - type_2
obj_06 obj_04 obj_02 - object)
(:init
(pred_4 obj_08 obj_09)
(pred_2 obj_08 obj_07)
(pred_2 obj_08 obj_12)
(pred_4 obj_03 obj_01)
(pred_2 obj_03 obj_10)
(pred_2 obj_03 obj_11)
(pred_3 obj_06 obj_05)
(pred_3 obj_04 obj_09)
(pred_3 obj_02 obj_05)
)
(:goal
(and
(pred_3 obj_06 obj_01)
(pred_3 obj_04 obj_05)
(pred_3 obj_02 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_05)))
)
)