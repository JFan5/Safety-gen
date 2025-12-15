(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_11 obj_03 - type_1
obj_05 obj_09 obj_01 obj_10 - type_3
obj_06 obj_08 obj_07 - type_2
obj_02 obj_04 - object)
(:init
(pred_3 obj_11 obj_07)
(pred_4 obj_11 obj_05)
(pred_4 obj_11 obj_09)
(pred_3 obj_03 obj_07)
(pred_4 obj_03 obj_01)
(pred_4 obj_03 obj_10)
(pred_2 obj_02 obj_07)
(pred_2 obj_04 obj_08)
)
(:goal
(and
(pred_2 obj_02 obj_06)
(pred_2 obj_04 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_06)))
)
)